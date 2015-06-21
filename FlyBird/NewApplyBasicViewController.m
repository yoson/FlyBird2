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
#import "MainViewController.h"
#import "NewApplyHouseViewController.h"
#import "BasicInfoModel.h"

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
    STextView *_coName;
    STextView *_coAge;
    STextView *_coId;
    STextView *_coRelationship;
    STextView *_coSex;
    STextView *_coTelNum;
    STextView *_coAddress;
    STextView *_guaName;
    STextView *_guaAge;
    STextView *_guaId;
    STextView *_guaRelationship;
    STextView *_guaSex;
    STextView *_guaTelNum;
    STextView *_guaAddress;
    
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
    UIView *coBorrower = [FlyBirdTool getTitleLable:CGPointMake(0, 35*i) setTitle:@"共同借款人信息"];
    [_scrollView addSubview:coBorrower];
    i++;
    _coName = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_coName setLableText:@"共借人姓名"];
    [_scrollView addSubview:_coName];
    i++;
    _coAge = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_coAge setLableText:@"年龄"];
    [_scrollView addSubview:_coAge];
    i++;
    _coId = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_coId setLableText:@"身份证号"];
    [_scrollView addSubview:_coId];
    i++;
    _coRelationship = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_coRelationship setLableText:@"与联系人关系"];
    [_scrollView addSubview:_coRelationship];
    i++;
    _coSex = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_coSex setLableText:@"性别"];
    [_coSex setFieldText:@"男、女"];
    [_scrollView addSubview:_coSex];
    i++;
    _coTelNum = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_coTelNum setLableText:@"联系电话"];
    [_scrollView addSubview:_coTelNum];
    i++;
    _coAddress = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_coAddress setLableText:@"居住地址"];
    [_scrollView addSubview:_coAddress];
    i++;
    UIView *guaBorrower = [FlyBirdTool getTitleLable:CGPointMake(0, 35*i) setTitle:@"担保人信息"];
    [_scrollView addSubview:guaBorrower];
    i++;
    _guaName = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_guaName setLableText:@"担保人姓名"];
    [_guaName setFieldText:@"|"];
    [_scrollView addSubview:_guaName];
    i++;
    _guaAge = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_guaAge setLableText:@"年龄"];
    [_scrollView addSubview:_guaAge];
    i++;
    _guaId = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_guaId setLableText:@"身份证号"];
    [_scrollView addSubview:_guaId];
    i++;
    _guaRelationship = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_guaRelationship setLableText:@"与联系人关系"];
    [_scrollView addSubview:_guaRelationship];
    i++;
    _guaSex = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_guaSex setLableText:@"性别"];
    [_guaSex setFieldText:@"男、女"];
    [_scrollView addSubview:_guaSex];
    i++;
    _guaTelNum = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_guaTelNum setLableText:@"联系电话"];
    [_scrollView addSubview:_guaTelNum];
    i++;
    _guaAddress = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_guaAddress setLableText:@"居住地址"];
    [_scrollView addSubview:_guaAddress];
}

-(void)clickLeft{
    MainViewController *controller = [[MainViewController alloc]init];
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}
-(void)clickRight{
    if(![_flag isEqualToString:@"check"])
        [self request];
    else{
        NewApplyHouseViewController *controller = [[NewApplyHouseViewController alloc]init];
        controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:controller animated:YES completion:nil];
    }
}
-(void)setData:(BasicInfoModel *)model{
    _edu.field.text = model.loanamount;
    _qixian.field.text = model.loanmonths;
    _yongtu.field.text = model.loanuse;
    _laiyuan.field.text= model.repaysource;
    _liushui.field.text = model.avgmonthbill;
    _gaikuang.field.text = model.creditoverview;
    _xingming.field.text = model.borrowername;
    _nianling.field.text = model.borrowerage;
    _shenfenzhenghao.field.text = model.borrowerid;
    _hunyin.field.text = model.borrowermarrage;
    _xingbie.field.text = model.borrowersex;
    _dianhua.field.text = model.borrowerphone;
    _dizhi.field.text = model.borroweraddr;
    _danwei.field.text = model.borrowerwork;
    _coName.field.text = model.coborrowername;
    _coAge.field.text=model.coborrowerage;
    _coId.field.text=model.coborrowerid;
    _coRelationship.field.text=model.coborrowerrelation;
    _coSex.field.text=model.coborrowersex;
    _coTelNum.field.text=model.coborrowerphone;
    _coAddress.field.text=model.coborroweraddr;
    _guaName.field.text=model.guarantorname;
    _guaAge.field.text=model.guarantorage;
    _guaId.field.text=model.guarantorid;
    _guaRelationship.field.text=model.guarantorrelation;
    _guaSex.field.text=model.guarantorsex;
    _guaTelNum.field.text=model.guarantorphone;
    _guaAddress.field.text=model.guarantoraddr;
    if([_flag isEqualToString:@"check"]){
        _edu.flag = YES;
        _qixian.flag = YES;
        _yongtu.flag = YES;
        _laiyuan.flag = YES;
        _liushui.flag = YES;
        _gaikuang.flag = YES;
        _xingming.flag = YES;
        _nianling.flag = YES;
        _shenfenzhenghao.flag = YES;
        _hunyin.flag = YES;
        _xingbie.flag = YES;
        _dianhua.flag = YES;
        _dizhi.flag = YES;
        _danwei.flag = YES;
        _coName.flag = YES;
        _coAge.flag = YES;
        _coId.flag = YES;
        _coRelationship.flag = YES;
        _coSex.flag = YES;
        _coTelNum.flag = YES;
        _coAddress.flag = YES;
        _guaName.flag = YES;
        _guaAge.flag = YES;
        _guaId.flag = YES;
        _guaRelationship.flag = YES;
        _guaSex.flag = YES;
        _guaTelNum.flag = YES;
        _guaAddress.flag = YES;
    }
}
-(void)queryInfo{
    NSString *param = [NSString stringWithFormat:@"id=%@&type=%@%@",[FlyBirdTool getValue:@"applyId"],@"orders",[FlyBirdTool getTsTK]];
    NSLog(@"parma:%@",param);
    HandlerBlock handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",text);
            NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            
            BasicInfoModel*model = [[BasicInfoModel alloc]init];
            [model parseResponse:array[0]];
            [self setData:model];
        }else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"内部服务器错误，请检查网络连接" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    };
    [FlyBirdTool httpPost:@"api/queryinfo/" param:param completeHander:handler];

}

-(void) request{
    NSString *applyId;
    if([_flag isEqualToString:@"add"]){
        applyId=@"";
    }else
        applyId =[FlyBirdTool getValue:@"applyId"];
    NSString *param = [NSString stringWithFormat:@"id=%@&sid=%@&pid=%@%@&borrowername=%@&loanamount=%@&loanuse=%@&repaysource=%@&avgmonthbill=%@&loanmonths=%@&creditoverview=%@&borrowerphone=%@&borrowerage=%@&borrowerid=%@&borrowermarrage=%@&borrowersex=%@&borroweraddr=%@&borrowerwork=%@&coborrowername=%@&coborrowerphone=%@&coborrowerage=%@&coborrowerid=%@&coborrowerrelation=%@&coborrowersex=%@&coborroweraddr=%@&guarantorname=%@&guarantorphone=%@&guarantorage=%@&guarantorid=%@&guarantorrelation=%@&guarantorsex=%@&guarantoraddr=%@",applyId,[FlyBirdTool getValue:@"userId"],[FlyBirdTool getValue:@"pId"],[FlyBirdTool getTsTK],_xingming.field.text,_edu.field.text,_yongtu.field.text,_laiyuan.field.text,_liushui.field.text,_qixian.field.text,_gaikuang.field.text,_dianhua.field.text,_nianling.field.text,_shenfenzhenghao.field.text,_hunyin.field.text,_xingbie.field.text,_dizhi.field.text,_danwei.field.text,_coName.field.text,_coAge.field.text,_coTelNum.field.text,_coId.field.text,_coRelationship.field.text,_coSex.field.text,_coAddress.field.text,_guaName.field.text,_guaAge.field.text,_guaTelNum.field.text,_guaId.field.text,_guaRelationship.field.text,_guaSex.field.text,_guaAddress.field.text];
    NSLog(@"parma:%@",param);
    HandlerBlock handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",text);
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            if([[[dic objectForKey:@"res"] stringValue] isEqualToString:@"200"]){
                [FlyBirdTool setKey:@"applyId" Value:[dic objectForKey:@"id"]];
                [FlyBirdTool setKey:@"flag" Value:@"modify"];
                NewApplyHouseViewController *controller = [[NewApplyHouseViewController alloc]init];
                controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
                [self presentViewController:controller animated:YES completion:nil];
            }else{
                UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"错误，请重新提交" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
                [alert show];
            }

        }else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"内部服务器错误，请检查网络连接" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    };
    [FlyBirdTool httpPost:@"api/submitbasic/" param:param completeHander:handler];
}

@end
