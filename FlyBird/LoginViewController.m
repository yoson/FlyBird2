//
//  ViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "LoginViewController.h"
#import "FlyBirdTool.h"
#import "MainViewController.h"

@interface LoginViewController (){
    UIButton * _login;
    UITextField *_userName;
    UITextField *_usePwd;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = YELLOW;
    
    UIImageView *view = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, 30, 200, 200)];
    [view setImage:[UIImage imageNamed:@"logo.png"]];
    [self.view addSubview:view];
    
    UILabel *userNameL = [[UILabel alloc]initWithFrame:CGRectMake(60, 230, 60, 40)];
    userNameL.text = @"用户名:";
    userNameL.textColor = [UIColor whiteColor];
    _userName = [[UITextField alloc]initWithFrame:CGRectMake(130, 233, SCREEN_WIDTH-190, 30)];
    _userName.layer.borderWidth=1;
    _userName.layer.borderColor=[[UIColor whiteColor]CGColor];
    _userName.placeholder = @" 请输入用户名";
    _userName.delegate = self;
    [self.view addSubview:userNameL];
    [self.view addSubview:_userName];
    
    UILabel *password = [[UILabel alloc]initWithFrame:CGRectMake(60, 290, 60, 40)];
    password.text = @"密码:";
    password.textColor = [UIColor whiteColor];
    _usePwd = [[UITextField alloc]initWithFrame:CGRectMake(130, 293, SCREEN_WIDTH-190, 30)];
    _usePwd.layer.borderWidth=1;
    _usePwd.layer.borderColor=[[UIColor whiteColor]CGColor];
    _usePwd.placeholder = @" 请输入密码";
    _usePwd.delegate=self;
    [self.view addSubview:password];
    [self.view addSubview:_usePwd];
    
    
    _login = [[UIButton alloc]initWithFrame:CGRectMake(60, 450, SCREEN_WIDTH-120, 30)];
    _login.backgroundColor = [UIColor whiteColor];
    [_login setTitle:@"登     陆" forState:UIControlStateNormal];
    [_login setTitleColor:YELLOW forState:UIControlStateNormal];
    [_login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_login];
}

- (void)login{
    
//    NSString *param = [NSString stringWithFormat:@"name=%@&passwd=%@%@&token=",_userName.text,[FlyBirdTool md5:_usePwd.text],[FlyBirdTool getTsTK]];
    NSString *param = [NSString stringWithFormat:@"name=%@&passwd=%@%@&token=",@"15810541077",[FlyBirdTool md5:@"111111"],[FlyBirdTool getTsTK]];
    NSLog(@"parma:%@",param);
    HandlerBlock handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",text);
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            if([[[dic objectForKey:@"res"] stringValue] isEqualToString:@"200"]){
                [FlyBirdTool setKey:@"userId" Value:[dic objectForKey:@"id"]];
                //[FlyBirdTool setKey:@"userId" Value:@"16"];
                MainViewController *controller = [[MainViewController alloc]init];
                controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
                [self presentViewController:controller animated:YES completion:nil];
            }else{
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"用户名或密码错误，请重新输入" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            }
        }else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"内部服务器错误，请检查网络连接" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    };
    [FlyBirdTool httpPost:@"api/login/" param:param completeHander:handler];
    
   
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    //[textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
