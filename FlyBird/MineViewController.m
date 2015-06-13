//
//  MineViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "MineViewController.h"
#import "FlyBirdTool.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SETBACKG;
    UIImage * apply =[UIImage imageNamed:@"mine.png"];
    UIImage * applyS =[UIImage imageNamed:@"mineS.png"];
    apply = [apply imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    applyS = [applyS imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:apply selectedImage:applyS];
    self.tabBar.backgroundColor = YELLOW;
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:YELLOW} forState:UIControlStateSelected];
    [self addNavBar];
}

-(void) addNavBar{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 23, SCREEN_WIDTH, 44)];
    //navBar.barTintColor = [UIColor colorWithHex:0xF5A64A alpha:0];
    navBar.barTintColor = YELLOW;
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:@"我的"];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"修改密码" style:UIBarButtonItemStylePlain target:self action:@selector(clickRight)];
    rightButton.tintColor = [UIColor blackColor];
    [item setRightBarButtonItem:rightButton animated:YES];
    [navBar pushNavigationItem:item animated:YES];
    [self.view addSubview:navBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
