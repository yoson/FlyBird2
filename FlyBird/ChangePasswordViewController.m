//
//  ForgetViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/17.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "ChangePasswordViewController.h"
#import "FlyBirdTool.h"
#import "MainViewController.h"
#import "STextView.h"

@interface ChangePasswordViewController (){
    STextView * oldPass;
    STextView * newPassOne;
    STextView * newPassTwo;
}

@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SETBACKG;
    [self addNavBar];
    
    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(0, 67, SCREEN_WIDTH, SCREEN_HEIGHT-67)];
    backView.backgroundColor = [UIColor whiteColor];
    oldPass = [[STextView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, 40)];
    [oldPass setLableText:@"旧密码:"];
    [oldPass setFieldText:@"请输入现有密码"];
    
    newPassOne = [[STextView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 40)];
    [newPassOne setLableText:@"新密码:"];
    [newPassOne setFieldText:@"请输入新密码"];
    
    newPassTwo = [[STextView alloc]initWithFrame:CGRectMake(0, 80, SCREEN_WIDTH, 40)];
    [newPassTwo setLableText:@"新密码:"];
    [newPassTwo setFieldText:@"请再次确认新密码"];
    [backView addSubview:oldPass];
    [backView addSubview:newPassOne];
    [backView addSubview:newPassTwo];
    [self.view addSubview:backView];
    
    
}

-(void) addNavBar{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 23, SCREEN_WIDTH, 44)];
    //navBar.barTintColor = [UIColor colorWithHex:0xF5A64A alpha:0];
    navBar.barTintColor = YELLOW;
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:@"修改密码"];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"< 返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft)];
    leftButton.tintColor = [UIColor blackColor];
    [item setLeftBarButtonItem:leftButton animated:YES];
        UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(clickRight)];
        rightButton.tintColor = [UIColor blackColor];
        [item setRightBarButtonItem:rightButton animated:YES];
    [navBar pushNavigationItem:item animated:YES];
    [self.view addSubview:navBar];
}

-(void)clickLeft{
    MainViewController *controller = [[MainViewController alloc]init];
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)clickRight{
    if(newPassTwo.field.text !=nil &&[newPassTwo.field.text isEqualToString:newPassOne.field.text]){
        NSString *param = [NSString stringWithFormat:@"id=%@%@&opasswd=%@&npasswd=%@",[FlyBirdTool getValue:@"id"],[FlyBirdTool getTsTK],[FlyBirdTool md5:oldPass.field.text],newPassOne.field.text];
    }else{
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"两次新密码输入不一致，请重新输入" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

@end
