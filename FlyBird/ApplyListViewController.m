//
//  ApplyListViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "ApplyListViewController.h"
#import "FlyBirdTool.h"
#import "ApplyListTableViewCell.h"
#import "ApplyListModel.h"
#import "ODRefreshControl.h"
#import "NewApplyBasicViewController.h"

@interface ApplyListViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_itemList;
    UIView *_downLineView;
    int btnWidth;
    int _status;
}

@end

@implementation ApplyListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self request:99];
    _status = 99;
    SETBACKG;
    _itemList = [[NSMutableArray alloc]init];
    UIImage * apply =[UIImage imageNamed:@"apply.png"];
    UIImage * applyS =[UIImage imageNamed:@"applyS.png"];
    apply = [apply imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    applyS = [applyS imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"申请" image:apply selectedImage:applyS];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:YELLOW} forState:UIControlStateSelected];
    [self addNavBar];
    [self addButton];
    
}

-(void)addButton{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 67, SCREEN_WIDTH, 30)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    btnWidth = (SCREEN_WIDTH-60)/5;
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, btnWidth, 25)];
    button1.tag = 1;
    [button1 setTitle:@"全部订单" forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [button1 setTitleColor:YELLOW forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(tabSelect:) forControlEvents:UIControlEventTouchUpInside];
    _downLineView = [[UIView alloc]initWithFrame:CGRectMake(10, 25, btnWidth, 5)];
    _downLineView.backgroundColor = YELLOW;
    [view addSubview:_downLineView];
    [view addSubview:button1];
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(10+btnWidth+10, 0, btnWidth, 25)];
    btn2.tag = 2;
    [btn2 setTitle:@"等待审核" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [btn2 setTitleColor:YELLOW forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(tabSelect:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn2];
    
    UIButton *btn3 = [[UIButton alloc]initWithFrame:CGRectMake(10+(btnWidth+10)*2, 0, btnWidth, 25)];
    btn3.tag = 3;
    [btn3 setTitle:@"补充材料" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [btn3 setTitleColor:YELLOW forState:UIControlStateNormal];
    [btn3 addTarget:self action:@selector(tabSelect:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc]initWithFrame:CGRectMake(10+(btnWidth+10)*3, 0, btnWidth, 25)];
    btn4.tag = 4;
    [btn4 setTitle:@"通过审核" forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [btn4 setTitleColor:YELLOW forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(tabSelect:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn4];
    
    UIButton *btn5 = [[UIButton alloc]initWithFrame:CGRectMake(10+(btnWidth+10)*4, 0, btnWidth, 25)];
    btn5.tag = 5;
    [btn5 setTitle:@"未通过" forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize: 12.0];
    [btn5 setTitleColor:YELLOW forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(tabSelect:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn5];
}
-(void)tabSelect:(UIButton *)btn{
    if(btn.tag == 1){
        _downLineView.frame = CGRectMake(10, 25, btnWidth, 5);
        _status = 99;
        [self request:99];
    }
    if(btn.tag == 2){
        _downLineView.frame = CGRectMake(10+btnWidth+10, 25, btnWidth, 5);
        _status = 98;
        [self request:98];
    }
    if(btn.tag == 3){
        _downLineView.frame = CGRectMake(10+(btnWidth+10)*2, 25, btnWidth, 5);
        _status = 96;
        [self request:96];
    }
    if(btn.tag == 4){
        _downLineView.frame = CGRectMake(10+(btnWidth+10)*3, 25, btnWidth, 5);
        _status = 95;
        [self request:95];
    }
    if(btn.tag == 5){
        _downLineView.frame = CGRectMake(10+(btnWidth+10)*4, 25, btnWidth, 5);
        _status = 97;
        [self request:97];
    }
}

-(void) addNavBar{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 23, SCREEN_WIDTH, 44)];
    //navBar.barTintColor = [UIColor colorWithHex:0xF5A64A alpha:0];
    navBar.barTintColor = YELLOW;
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:@"申请"];
   // UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"新增" style:UIBarButtonItemStylePlain target:self action:@selector(clickRight)];
UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(clickRight)];
    rightButton.tintColor = [UIColor blackColor];
    [item setRightBarButtonItem:rightButton animated:YES];
    [navBar pushNavigationItem:item animated:YES];
    [self.view addSubview:navBar];
    //[self request:1];
}

-(void) clickRight{
    [FlyBirdTool setKey:@"flag" Value:@"add"];
    NewApplyBasicViewController *controller = [[NewApplyBasicViewController alloc]init];
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)loadTableView{
    [_tableView removeFromSuperview];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 97, SCREEN_WIDTH, SCREEN_HEIGHT-97-49) style:UITableViewStylePlain];
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
        [self request:_status];
        [refreshControl endRefreshing];
    });
}

-(void) request:(NSInteger)status{
    NSString *param = [NSString stringWithFormat:@"id=%@&status=%ld%@",[FlyBirdTool getValue:@"userId"],status,[FlyBirdTool getTsTK]];
    NSLog(@"parma:%@",param);
    HandlerBlock handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",text);
            NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            [_itemList removeAllObjects];
            for(int i=0;i<array.count;i++){
                ApplyListModel *model = [[ApplyListModel alloc]init];
                [model parseResponse:array[i]];
                [_itemList addObject:model];
            }
            [self loadTableView];
        }else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"内部服务器错误，请检查网络连接" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    };
    [FlyBirdTool httpPost:@"api/querylist/" param:param completeHander:handler];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _itemList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [ApplyListTableViewCell height];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ApplyListTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"ApplyCell"];
    if(cell == nil){
        cell = [[ApplyListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ApplyCell"];
    }
    [cell setData:_itemList[indexPath.row]];
    return  cell;
}

@end
