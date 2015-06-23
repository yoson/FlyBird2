//
//  NewApplyCarViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/20.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "NewApplyCarViewController.h"
#import "STextView.h"
#import "PhotoView.h"
#import "FlyBirdTool.h"
#import "CarInfoModel.h"
#import "NewApplyHouseViewController.h"
#import "UIImageView+WebCache.h"
#import "NewApplyOtherViewController.h"

@interface NewApplyCarViewController (){
    NSString *_flag;
    UIScrollView *_scrollView;
    STextView *_carid;
    STextView *_mileage;
    STextView *_cartype;
    STextView *_fueltype;
    STextView *_carbrand;
    STextView *_emissions;
    STextView *_buytime;
    STextView *_buyprice;
    STextView *_assessedprice;
    STextView *_assessedagency;
    
    
    PhotoView *_photo1;
    PhotoView *_photo2;
    PhotoView *_photo3;
    PhotoView *_photo4;
    PhotoView *_photo5;
    PhotoView *_photo6;
    PhotoView *_photo7;
    PhotoView *_photo8;
}

@end

@implementation NewApplyCarViewController

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
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 1500);
    _scrollView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:_scrollView];
    [self addHouseInfo];
    [self addPhoto];
}
- (void)addHouseInfo{
    UIView *info = [FlyBirdTool getTitleLable:CGPointMake(0, 0) setTitle:@"车辆信息"];
    [_scrollView addSubview:info];
    int i =1;
    _carid = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_carid setLableText:@"车辆编号"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_carid];
    i++;
    _mileage = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_mileage setLableText:@"行驶里程"];
    [_mileage setFieldText:@"单位(公里)"];
    [_scrollView addSubview:_mileage];
    i++;
    _cartype = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_cartype setLableText:@"车辆级别"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_cartype];
    i++;
    _fueltype = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_fueltype setLableText:@"燃油类别"];
    [_fueltype setFieldText:@"例如汽油95＃ 柴油等"];
    [_scrollView addSubview:_fueltype];
    i++;
    _carbrand = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_carbrand setLableText:@"车辆品牌"];
    [_carbrand setFieldText:@"例如大众迈腾、宝马325i等"];
    [_scrollView addSubview:_carbrand];
    i++;
    _emissions = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_emissions setLableText:@"排量"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_emissions];
    i++;
    _buytime = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_buytime setLableText:@"购车时间"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_buytime];
    i++;
    _buyprice = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_buyprice setLableText:@"购车价格"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_buyprice];
    i++;
    _assessedprice = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_assessedprice setLableText:@"二手车估价"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_assessedprice];
    i++;
    _assessedagency = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_assessedagency setLableText:@"评估机构"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_assessedagency];
    i++;
    UIView *jiafang = [FlyBirdTool getTitleLable:CGPointMake(0, 35*i) setTitle:@"车辆照片"];
    [_scrollView addSubview:jiafang];
}

-(void) addNavBar{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 23, SCREEN_WIDTH, 44)];
    navBar.barTintColor = YELLOW;
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:@"车辆信息(3/5)"];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithTitle:@"上一步" style:UIBarButtonItemStylePlain target:self action:@selector(clickLeft)];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(clickRight)];
    leftButton.tintColor = [UIColor blackColor];
    rightButton.tintColor = [UIColor blackColor];
    [item setLeftBarButtonItem:leftButton animated:YES];
    [item setRightBarButtonItem:rightButton animated:YES];
    [navBar pushNavigationItem:item animated:YES];
    [self.view addSubview:navBar];
}

-(void)addPhoto{
    _photo1 = [[PhotoView alloc]initWithFrame:CGRectMake(10, 12*35+10, 0, 0)];
    _photo1.controller = self;
    _photo1.type = @"cars";
    _photo1.detail = @"carimgs";
    [_scrollView addSubview:_photo1];
    _photo2 = [[PhotoView alloc]initWithFrame:CGRectMake(10+(SCREEN_WIDTH-40)/2+20, 12*35+10, 0, 0)];
    _photo2.type = @"cars";
    _photo2.detail = @"carimgs2";
    _photo2.controller = self;
    [_scrollView addSubview:_photo2]; 
    _photo3 = [[PhotoView alloc]initWithFrame:CGRectMake(10, 12*35+10+(SCREEN_WIDTH-40)/2+10, 0, 0)];
    _photo3.type = @"cars";
    _photo3.detail = @"carimgs3";
    _photo3.controller = self;
    [_scrollView addSubview:_photo3];
    _photo4 = [[PhotoView alloc]initWithFrame:CGRectMake(10+(SCREEN_WIDTH-40)/2+20, 12*35+10+(SCREEN_WIDTH-40)/2+10, 0, 0)];
    _photo4.type = @"cars";
    _photo4.detail = @"carimgs4";
    _photo4.controller = self;
    [_scrollView addSubview:_photo4];
    _photo5 = [[PhotoView alloc]initWithFrame:CGRectMake(10, 12*35+10+((SCREEN_WIDTH-40)/2+10)*2, 0, 0)];
    _photo5.type = @"cars";
    _photo5.detail = @"carimgs5";
    _photo5.controller = self;
    [_scrollView addSubview:_photo5];
    _photo6 = [[PhotoView alloc]initWithFrame:CGRectMake(10+(SCREEN_WIDTH-40)/2+20, 12*35+10+((SCREEN_WIDTH-40)/2+10)*2, 0, 0)];
    _photo6.type = @"cars";
    _photo6.detail = @"carimgs6";
    _photo6.controller = self;
    [_scrollView addSubview:_photo6];
    int a = 12*35+10+((SCREEN_WIDTH-40)/2+10)*3;
    UIView *pinggubiao = [FlyBirdTool getTitleLable:CGPointMake(0, a) setTitle:@"其他补充资料"];
    [_scrollView addSubview:pinggubiao];
    
    _photo7 = [[PhotoView alloc]initWithFrame:CGRectMake(10, a+45, 0, 0)];
    _photo7.type = @"cars";
    _photo7.detail = @"otherimgs";
    _photo7.controller = self;
    [_scrollView addSubview:_photo7];
    _photo8 = [[PhotoView alloc]initWithFrame:CGRectMake(10+(SCREEN_WIDTH-40)/2+20, a+45, 0, 0)];
    _photo8.type = @"cars";
    _photo8.detail = @"otherimgs2";
    _photo8.controller = self;
    [_scrollView addSubview:_photo8];
    
}

-(void)clickLeft{
//    if([[FlyBirdTool getValue:@"flag"]isEqualToString:@"add"])
//        [FlyBirdTool setKey:@"flag" Value:@"modify"];
    NewApplyHouseViewController *controller = [[NewApplyHouseViewController alloc]init];
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}
-(void)clickRight{
    if(![_flag isEqualToString:@"check"]){
        [self request];
    }
    else{
    NewApplyOtherViewController *controller = [[NewApplyOtherViewController alloc]init];
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
    }
}
-(void) request{
    NSString *applyId=[FlyBirdTool getValue:@"applyId"];
    NSString *param = [NSString stringWithFormat:@"id=%@%@&carid=%@&mileage=%@&cartype=%@&fueltype=%@&carbrand=%@&emissions=%@&buytime=%@&buyprice=%@&assessedprice=%@&assessedagency=%@",applyId,[FlyBirdTool getTsTK],_carid.field.text,_mileage.field.text,_cartype.field.text,_fueltype.field.text,_carbrand.field.text,_emissions.field.text,_buytime.field.text,_buyprice.field.text,_assessedprice.field.text,_assessedagency.field.text];
    NSLog(@"parma:%@",param);
    HandlerBlock handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",text);
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            if([[[dic objectForKey:@"res"] stringValue] isEqualToString:@"200"]){
                NewApplyOtherViewController *controller = [[NewApplyOtherViewController alloc]init];
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
    [FlyBirdTool httpPost:@"api/submitcar/" param:param completeHander:handler];
}


-(void)queryInfo{
    NSString *param = [NSString stringWithFormat:@"id=%@&type=%@%@",[FlyBirdTool getValue:@"applyId"],@"cars",[FlyBirdTool getTsTK]];
    NSLog(@"parma:%@",param);
    HandlerBlock handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",text);
            if(![text isEqualToString:@"[]"]){
                NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
                
                CarInfoModel*model = [[CarInfoModel alloc]init];
                [model parseResponse:array[0]];
                [self setData:model];
            }
        }else{
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"内部服务器错误，请检查网络连接" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
        }
    };
    [FlyBirdTool httpPost:@"api/queryinfo/" param:param completeHander:handler];
}

-(void)setData:(CarInfoModel *)model{
    _carid.field.text=model.carid;
    _mileage.field.text=model.mileage;
    _cartype.field.text=model.cartype;
    _fueltype.field.text=model.fueltype;
    _carbrand.field.text=model.carbrand;
    _emissions.field.text=model.emissions;
    _buytime.field.text=model.buytime;
    _buyprice.field.text=model.buyprice;
    _assessedprice.field.text=model.assessedprice;
    _assessedagency.field.text=model.assessedagency;
    _photo1.field.text=model.photoI1;
    [_photo1.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo1]];
    _photo2.field.text=model.photoI2;
    [_photo2.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo2]];
    _photo3.field.text=model.photoI3;
    [_photo3.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo3]];
    _photo4.field.text=model.photoI4;
    [_photo4.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo4]];
    _photo5.field.text=model.photoI5;
    [_photo5.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo5]];
    _photo6.field.text=model.photoI6;
    [_photo6.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo6]];
    _photo7.field.text=model.photoI7;
    [_photo7.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo7]];
    _photo8.field.text=model.photoI8;
    [_photo8.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo8]];
    if([_flag isEqualToString:@"check"]){
        _carid.flag = YES;
        _cartype.flag = YES;
        _mileage.flag = YES;
        _fueltype.flag = YES;
        _carbrand.flag = YES;
        _emissions.flag = YES;
        _buytime.flag = YES;
        _buyprice.flag = YES;
        _assessedprice.flag = YES;
        _assessedagency.flag = YES;
        _photo1.flag = YES;
        [_photo1 setButtonNo];
        _photo2.flag = YES;
        [_photo2 setButtonNo];
        _photo3.flag = YES;
        [_photo3 setButtonNo];
        _photo4.flag = YES;
        [_photo4 setButtonNo];
        _photo5.flag = YES;
        [_photo5 setButtonNo];
        _photo6.flag = YES;
        [_photo6 setButtonNo];
        _photo7.flag = YES;
        [_photo7 setButtonNo];
        _photo8.flag = YES;
        [_photo8 setButtonNo];
        
    }
    
}


@end
