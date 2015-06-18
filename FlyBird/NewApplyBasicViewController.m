//
//  NewApplyBasicViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/18.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "NewApplyBasicViewController.h"
#import "FlyBirdTool.h"
#import "STextView.h"

@interface NewApplyBasicViewController (){
    NSString *_flag;
    UIScrollView *_scrollView;
    STextView *_edu;
    STextView *_qixian;
    STextView *_yongtu;
    STextView *_laiyuan;
    STextView *_liushui;
    STextView *_gaikuang;
    STextView *_xingming;
    STextView *_nianling;
    STextView *_shenfenzhenghao;
    STextView *_hunyin;
    STextView *_xingbie;
    STextView *_dianhua;
    STextView *_dizhi;
    STextView *_danwei;
}

@end

@implementation NewApplyBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SETBACKG;
    _flag = [FlyBirdTool getValue:@"flag"];
    if(![_flag isEqualToString:@"add"]){
        [self queryInfo];
    }
    [self addNavBar];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 67, SCREEN_WIDTH, SCREEN_HEIGHT-67)];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 1200);
    _scrollView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:_scrollView];
    [self addBasic];
}

-(void) addNavBar{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 23, SCREEN_WIDTH, 44)];
    //navBar.barTintColor = [UIColor colorWithHex:0xF5A64A alpha:0];
    navBar.barTintColor = YELLOW;
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:@"基本信息(1/5)"];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft)];
     UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(clickRight)];
    leftButton.tintColor = [UIColor blackColor];
    rightButton.tintColor = [UIColor blackColor];
    [item setLeftBarButtonItem:leftButton animated:YES];
    [item setRightBarButtonItem:rightButton animated:YES];
    [navBar pushNavigationItem:item animated:YES];
    [self.view addSubview:navBar];
}

-(void)addBasic{
    UIView *info = [FlyBirdTool getTitleLable:CGPointMake(0, 0) setTitle:@"贷款信息"];
    [_scrollView addSubview:info];
    _edu = [[STextView alloc]initWithFrame:CGRectMake(0, 35, 0, 0)];
    [_edu setLableText:@"贷款额度"];
    [_edu setFieldText:@"单位(元)"];
    [_scrollView addSubview:_edu];
    _qixian = [[STextView alloc]initWithFrame:CGRectMake(0, 35*2, 0, 0)];
    [_qixian setLableText:@"贷款期限"];
    [_qixian setFieldText:@"单位(月)"];
    [_scrollView addSubview:_qixian];
    _yongtu = [[STextView alloc]initWithFrame:CGRectMake(0, 35*3, 0, 0)];
    [_yongtu setLableText:@"贷款用途"];
    [_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_yongtu];
    _laiyuan = [[STextView alloc]initWithFrame:CGRectMake(0, 35*4, 0, 0)];
    [_laiyuan setLableText:@"还款来源"];
    [_scrollView addSubview:_laiyuan];
    _liushui = [[STextView alloc]initWithFrame:CGRectMake(0, 35*5, 0, 0)];
    [_liushui setLableText:@"月均流水"];
    [_liushui setFieldText:@"单位(元)"];
    [_scrollView addSubview:_liushui];
    _gaikuang= [[STextView alloc]initWithFrame:CGRectMake(0, 35*6, 0, 0)];
    [_gaikuang setLableText:@"征信概况"];
    [_scrollView addSubview:_gaikuang];
    
    int i = 7;
    UIView *borrower = [FlyBirdTool getTitleLable:CGPointMake(0, 35*i) setTitle:@"贷款人信息"];
    [_scrollView addSubview:borrower];
    i++;
    _xingming = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_xingming setLableText:@"贷款人姓名"];
    [_scrollView addSubview:_xingming];
    i++;
    _nianling = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_nianling setLableText:@"年龄"];
     [_nianling setFieldText:@"单位(岁)"];
    [_scrollView addSubview:_nianling];
    i++;
    _shenfenzhenghao = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_shenfenzhenghao setLableText:@"身份证号"];
    [_scrollView addSubview:_shenfenzhenghao];
    i++;
    _hunyin = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_hunyin setLableText:@"婚姻状况"];
     [_hunyin setFieldText:@"已婚、未婚"];
    [_scrollView addSubview:_hunyin];
    i++;
    _xingbie = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_xingbie setLableText:@"性别"];
    [_scrollView addSubview:_xingbie];
    i++;
    _dianhua = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_dianhua setLableText:@"电话"];
    [_scrollView addSubview:_dianhua];
    i++;
    _dizhi = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_dizhi setLableText:@"家庭地址"];
    [_scrollView addSubview:_dizhi];
    i++;
    _danwei = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_danwei setLableText:@"工作单位"];
    [_scrollView addSubview:_danwei];
    i++;
    
}

-(void)queryInfo{
    
}

@end
