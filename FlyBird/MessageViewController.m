//
//  MessageViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "MessageViewController.h"
#import "FlyBirdTool.h"
#import "MessageListTableViewCell.h"
#import "MessageListModel.h"
#import "ODRefreshControl.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_itemList;
    UITableView *_tableView;
}


@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SETBACKG;
    UIImage * apply =[UIImage imageNamed:@"message.png"];
    UIImage * applyS =[UIImage imageNamed:@"messageS.png"];
    apply = [apply imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    applyS = [applyS imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息" image:apply selectedImage:applyS];
    self.tabBar.backgroundColor = YELLOW;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:YELLOW} forState:UIControlStateSelected];
    [self addNavBar];
    _itemList = [[NSMutableArray alloc]init];
    [self request];
}

-(void) addNavBar{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 23, SCREEN_WIDTH, 44)];
    //navBar.barTintColor = [UIColor colorWithHex:0xF5A64A alpha:0];
    navBar.barTintColor = YELLOW;
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:@"消息"];
    [navBar pushNavigationItem:item animated:YES];
    [self.view addSubview:navBar];
}

- (void)loadTableView{
    [_tableView removeFromSuperview];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 67, SCREEN_WIDTH, SCREEN_HEIGHT-67-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle=UITableViewCellSelectionStyleNone;
    ODRefreshControl *refresh = [[ODRefreshControl alloc] initInScrollView:_tableView];
    [refresh addTarget:self action:@selector(dropViewDidBeginRefreshing:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_tableView];
}

- (void)dropViewDidBeginRefreshing:(ODRefreshControl *)refreshControl
{
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self request];
        [refreshControl endRefreshing];
    });
}

-(void) request{
    NSString *param = [NSString stringWithFormat:@"id=%@%@",[FlyBirdTool getValue:@"userId"],[FlyBirdTool getTsTK]];
    NSLog(@"parma:%@",param);
    HandlerBlock handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",text);
            NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            [_itemList removeAllObjects];
            for(int i=0;i<array.count;i++){
                MessageListModel *model = [[MessageListModel alloc]init];
                [model parseResponse:array[i]];
                [_itemList addObject:model];
            }
            [self loadTableView];
        }else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"内部服务器错误，请检查网络连接" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    };
    [FlyBirdTool httpPost:@"api/newslist/" param:param completeHander:handler];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _itemList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [MessageListTableViewCell height];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageListTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"MessageCell"];
    if(cell == nil){
        cell = [[MessageListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MessageCell"];
    }
    [cell setData:_itemList[indexPath.row]];
    return  cell;
}

@end
