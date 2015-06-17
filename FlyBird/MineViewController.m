//
//  MineViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "MineViewController.h"
#import "FlyBirdTool.h"
#import "LoginViewController.h"
#import "ChangePasswordViewController.h"

@interface MineViewController (){
    UIView *_backView;
    UILabel *_userName;
    UILabel *_cityManager;
    UILabel *_allApply;
    UILabel *_passFirst;
    UILabel *_passEnd;
    UILabel *_noPass;
}

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self request];
    SETBACKG;
    UIImage * apply =[UIImage imageNamed:@"mine.png"];
    UIImage * applyS =[UIImage imageNamed:@"mineS.png"];
    apply = [apply imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    applyS = [applyS imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:apply selectedImage:applyS];
    self.tabBar.backgroundColor = YELLOW;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:YELLOW} forState:UIControlStateSelected];
    [self addNavBar];
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 67, SCREEN_WIDTH, 230)];
    _backView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_backView];
    [self addMine];
    [self addStastics];
    
    UIButton * unregBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 380, SCREEN_WIDTH, 40)];
    unregBtn.backgroundColor = [UIColor whiteColor];
    [unregBtn setTitle:@"退 出 登 录" forState:UIControlStateNormal];
    [unregBtn addTarget:self action:@selector(unregister)  forControlEvents :UIControlEventTouchUpInside];
    [unregBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [unregBtn setTitleColor:YELLOW forState:UIControlStateNormal];
    
    [self.view addSubview:unregBtn];
}

-(void) addNavBar{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 23, SCREEN_WIDTH, 44)];
    //navBar.barTintColor = [UIColor colorWithHex:0xF5A64A alpha:0];
    navBar.barTintColor = YELLOW;
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:@"我的"];
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"修改密码" style:UIBarButtonItemStylePlain target:self action:@selector(clickRight)];
//    rightButton.tintColor = [UIColor blackColor];
//    [item setRightBarButtonItem:rightButton animated:YES];
    [navBar pushNavigationItem:item animated:YES];
    [self.view addSubview:navBar];
}

- (void)addMine{
    
    UIView * line = [FlyBirdTool getMaxCutLine:CGPointMake(0, 0)];
    UILabel *_id = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 100, 15)];
    _id.font = [UIFont systemFontOfSize:12];
    _id.text = @"个人信息";
    _id.alpha = 0.3;
    UIButton *unregBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 15, 90, 15)];
    
    [unregBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [unregBtn addTarget:self action:@selector(changePwd)  forControlEvents :UIControlEventTouchUpInside];
    unregBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [unregBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:12]];
    [unregBtn setTitleColor:YELLOW forState:UIControlStateNormal];
    UIView *line1 = [FlyBirdTool getMinCutLine:CGPointMake(0, 35)];
    _userName = [[UILabel alloc]initWithFrame:CGRectMake(10,40,300,25)];
    _userName.font = [UIFont systemFontOfSize:14];
    _cityManager = [[UILabel alloc]initWithFrame:CGRectMake(10,65,300,25)];
    _cityManager.font = [UIFont systemFontOfSize:14];
    UIView * line2 = [FlyBirdTool getMaxCutLine:CGPointMake(0, 90)];
    [_backView addSubview:unregBtn];
    [_backView addSubview:line2];
    [_backView addSubview:_id];
    [_backView addSubview:line];
    [_backView addSubview:line1];
    [_backView addSubview:_userName];
    [_backView addSubview:_cityManager];
}

- (void)changePwd{
    ChangePasswordViewController *controller = [[ChangePasswordViewController alloc]init];
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)unregister{
    LoginViewController *controller = [[LoginViewController alloc]init];
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)addStastics{
    
    //UIView * line = [FlyBirdTool getMaxCutLine:CGPointMake(0, 0)];
    UILabel *_id = [[UILabel alloc]initWithFrame:CGRectMake(10, 105, 100, 15)];
    _id.font = [UIFont systemFontOfSize:12];
    _id.text = @"业绩统计";
    _id.alpha = 0.3;
    UIView *line1 = [FlyBirdTool getMinCutLine:CGPointMake(0, 125)];
    _allApply = [[UILabel alloc]initWithFrame:CGRectMake(10,130,120,25)];
    _allApply.font = [UIFont systemFontOfSize:14];
    _passFirst = [[UILabel alloc]initWithFrame:CGRectMake(10,155,120,25)];
    _passFirst.font = [UIFont systemFontOfSize:14];
    _passEnd = [[UILabel alloc]initWithFrame:CGRectMake(10,180,120,25)];
    _passEnd.font = [UIFont systemFontOfSize:14];
    _noPass = [[UILabel alloc]initWithFrame:CGRectMake(10,205,120,25)];
    _noPass.font = [UIFont systemFontOfSize:14];

    [_backView addSubview:_id];
    [_backView addSubview:line1];
    [_backView addSubview:_allApply];
    [_backView addSubview:_passFirst];
    [_backView addSubview:_passEnd];
    [_backView addSubview:_noPass];
}

- (void)setData:(NSDictionary *)dic{
    _userName.text = [NSString stringWithFormat:@"业务经理:%@",[FlyBirdTool getValue:@"nick"]];
    _cityManager.text = [NSString stringWithFormat:@"城市经理:%@",[dic objectForKey:@"nick"]];
    _allApply.text = [NSString stringWithFormat:@"全部申请:  %@",[dic objectForKey:@"all"]];
    _passFirst.text = [NSString stringWithFormat:@"通过初审:  %@",[dic objectForKey:@"firstfail"]];
    _passEnd.text = [NSString stringWithFormat:@"通过终审:  %@",[dic objectForKey:@"lastfail"]];
    _noPass.text = [NSString stringWithFormat:@"未通过:     %@",[dic objectForKey:@"suc"]];
}

-(void) request{
    NSString *param = [NSString stringWithFormat:@"id=%@%@&pid=%@",[FlyBirdTool getValue:@"userId"],[FlyBirdTool getTsTK],[FlyBirdTool getValue:@"pId"]];
    NSLog(@"parma:%@",param);
    HandlerBlock handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",text);
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            
            [self setData:dic];
        }else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"内部服务器错误，请检查网络连接" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    };
    [FlyBirdTool httpPost:@"api/myinfo/" param:param completeHander:handler];
}

@end
