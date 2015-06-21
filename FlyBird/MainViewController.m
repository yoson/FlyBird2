//
//  MainViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "MainViewController.h"
#import "ApplyListViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "FlyBirdTool.h"

@interface MainViewController ()<UITabBarControllerDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ApplyListViewController *applyTab = [[ApplyListViewController alloc]init];
    MessageViewController *messageTab = [[MessageViewController alloc]init];
    messageTab.tabBarItem.tag = 1;
    self.delegate = self;
    MineViewController *mineTab = [[MineViewController alloc]init];
    self.viewControllers=@[applyTab,messageTab,mineTab];
    for(UIViewController *controller in self.viewControllers){
        UIViewController *view = controller.view;
    }
    
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if(viewController.tabBarItem.tag == 1){
        viewController.tabBarItem.badgeValue = nil;
        UInt64 ts = [[NSDate date] timeIntervalSince1970]*1000;
        NSString *str = [NSString stringWithFormat:@"%llu",ts];
        [FlyBirdTool setKey:@"ts" Value:str];
        
    }
}

@end
