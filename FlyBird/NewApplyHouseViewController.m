//
//  NewApplyHouseViewController.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/20.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "NewApplyHouseViewController.h"
#import "FlyBirdTool.h"
#import "PhotoView.h"
#import "STextView.h"
#import "NewApplyBasicViewController.h"
#import "NewApplyCarViewController.h"
#import "HouseInfoModel.h"
#import "UIImageView+WebCache.h"
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import "NewApplyCarViewController.h"
#import <AddressBook/AddressBook.h>

@interface NewApplyHouseViewController ()<CLLocationManagerDelegate>{
    NSString *_flag;
    UIScrollView *_scrollView;
    STextView *_address;
    STextView *_size;
    STextView *_mortgage;
    STextView *_perPrice;
    STextView *_totalPrice;
    STextView *_agency;
    PhotoView *_photo1;
    PhotoView *_photo2;
    PhotoView *_photo3;
    PhotoView *_photo4;
    PhotoView *_photo5;
    PhotoView *_photo6;
    PhotoView *_photo7;
    PhotoView *_photo8;
    PhotoView *_photo9;
    PhotoView *_photo10;
    CLLocationManager *_locationManager;
}

@end

@implementation NewApplyHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    SETBACKG;
    _flag = [FlyBirdTool getValue:@"flag"];
    if(![_flag isEqualToString:@"add"]){
        [self queryInfo];
    }
    _locationManager=[[CLLocationManager alloc]init];
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位服务当前可能尚未打开，请设置打开！");
        return;
    }
    //如果没有授权则请求用户授权
    if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusNotDetermined){
        [_locationManager requestWhenInUseAuthorization];
    }else if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse){
        _locationManager.delegate= self;
        _locationManager.desiredAccuracy=kCLLocationAccuracyNearestTenMeters;
        _locationManager.distanceFilter = 1000.0f;
        [_locationManager startUpdatingLocation];
    }
    [self addNavBar];
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 67, SCREEN_WIDTH, SCREEN_HEIGHT-67)];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 1200);
    _scrollView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:_scrollView];
    [self addHouseInfo];
    [self addPhoto];
}
- (void)addHouseInfo{
    UIView *info = [FlyBirdTool getTitleLable:CGPointMake(0, 0) setTitle:@"房产信息"];
    [_scrollView addSubview:info];
    int i =1;
    _address = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_address setLableText:@"房屋位置"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_address];
    i++;
    _size = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_size setLableText:@"建筑面积"];
    [_size setFieldText:@"单位(平米)"];
    [_scrollView addSubview:_size];
    i++;
    _mortgage = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_mortgage setLableText:@"抵押情况"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_mortgage];
    i++;
    _perPrice = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_perPrice setLableText:@"评估值单价"];
    [_perPrice setFieldText:@"单位(元)"];
    [_scrollView addSubview:_perPrice];
    i++;
    _totalPrice = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_totalPrice setLableText:@"总价"];
    [_totalPrice setFieldText:@"单位(元)"];
    [_scrollView addSubview:_totalPrice];
    i++;
    _agency = [[STextView alloc]initWithFrame:CGRectMake(0, 35*i, 0, 0)];
    [_agency setLableText:@"评估机构"];
    //[_yongtu setFieldText:@"例如：买房、买车、结婚、装修等"];
    [_scrollView addSubview:_agency];
    i++;
    UIView *jiafang = [FlyBirdTool getTitleLable:CGPointMake(0, 35*i) setTitle:@"家访照片"];
    [_scrollView addSubview:jiafang];
}

-(void) addNavBar{
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 23, SCREEN_WIDTH, 44)];
    navBar.barTintColor = YELLOW;
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:@"房产信息(2/5)"];
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
    _photo1 = [[PhotoView alloc]initWithFrame:CGRectMake(10, 8*35+10, 0, 0)];
    _photo1.controller = self;
    _photo1.type = @"houses";
    _photo1.detail = @"houseimgs";
    [_scrollView addSubview:_photo1];
    _photo2 = [[PhotoView alloc]initWithFrame:CGRectMake(10+(SCREEN_WIDTH-40)/2+20, 8*35+10, 0, 0)];
    _photo2.type = @"houses";
    _photo2.detail = @"houseimgs2";
    _photo2.controller = self;
    [_scrollView addSubview:_photo2];
    _photo3 = [[PhotoView alloc]initWithFrame:CGRectMake(10, 8*35+10+(SCREEN_WIDTH-40)/2+10, 0, 0)];
    _photo3.type = @"houses";
    _photo3.detail = @"houseimgs3";
    _photo3.controller = self;
    [_scrollView addSubview:_photo3];
    _photo4 = [[PhotoView alloc]initWithFrame:CGRectMake(10+(SCREEN_WIDTH-40)/2+20, 8*35+10+(SCREEN_WIDTH-40)/2+10, 0, 0)];
    _photo4.type = @"houses";
    _photo4.detail = @"houseimgs4";
    _photo4.controller = self;
    [_scrollView addSubview:_photo4];
    _photo5 = [[PhotoView alloc]initWithFrame:CGRectMake(10, 8*35+10+((SCREEN_WIDTH-40)/2+10)*2, 0, 0)];
    _photo5.type = @"houses";
    _photo5.detail = @"houseimgs5";
    _photo5.controller = self;
    [_scrollView addSubview:_photo5];
    _photo6 = [[PhotoView alloc]initWithFrame:CGRectMake(10+(SCREEN_WIDTH-40)/2+20, 8*35+10+((SCREEN_WIDTH-40)/2+10)*2, 0, 0)];
    _photo6.type = @"houses";
    _photo6.detail = @"houseimgs6";
    _photo6.controller = self;
    [_scrollView addSubview:_photo6];
    int a = 8*35+10+((SCREEN_WIDTH-40)/2+10)*3;
    UIView *pinggubiao = [FlyBirdTool getTitleLable:CGPointMake(0, a) setTitle:@"调查评估表"];
    [_scrollView addSubview:pinggubiao];
    
    _photo7 = [[PhotoView alloc]initWithFrame:CGRectMake(10, a+45, 0, 0)];
    _photo7.type = @"houses";
    _photo7.detail = @"investigationimgs";
    _photo7.controller = self;
    [_scrollView addSubview:_photo7];
    _photo8 = [[PhotoView alloc]initWithFrame:CGRectMake(10+(SCREEN_WIDTH-40)/2+20, a+45, 0, 0)];
    _photo8.type = @"houses";
    _photo8.detail = @"investigationimgs2";
    _photo8.controller = self;
    [_scrollView addSubview:_photo8];
    int b= a+45+(SCREEN_WIDTH-40)/2+10;
    UIView *qita = [FlyBirdTool getTitleLable:CGPointMake(0, b) setTitle:@"其他补充资料"];
    [_scrollView addSubview:qita];
    
    _photo9 = [[PhotoView alloc]initWithFrame:CGRectMake(10, b+45, 0, 0)];
    _photo9.type = @"houses";
    _photo9.detail = @"otherimgs";
    _photo9.controller = self;
    [_scrollView addSubview:_photo9];
    _photo10 = [[PhotoView alloc]initWithFrame:CGRectMake(10+(SCREEN_WIDTH-40)/2+20, b+45, 0, 0)];
    _photo10.type = @"houses";
    _photo10.detail = @"otherimgs2";
    _photo10.controller = self;
    [_scrollView addSubview:_photo10];
    
}

-(void)clickLeft{
    if([[FlyBirdTool getValue:@"flag"]isEqualToString:@"add"])
        [FlyBirdTool setKey:@"flag" Value:@"modify"];
    NewApplyBasicViewController *controller = [[NewApplyBasicViewController alloc]init];
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}
-(void)clickRight{
    NewApplyCarViewController *controller = [[NewApplyCarViewController alloc]init];
    controller.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)queryInfo{
    NSString *param = [NSString stringWithFormat:@"id=%@&type=%@%@",[FlyBirdTool getValue:@"applyId"],@"houses",[FlyBirdTool getTsTK]];
    NSLog(@"parma:%@",param);
    HandlerBlock handler = ^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil){
            NSString *text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"%@",text);
            if(![text isEqualToString:@"[]"]){
            NSArray * array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
            
            HouseInfoModel*model = [[HouseInfoModel alloc]init];
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

-(void)setData:(HouseInfoModel *)model{
    _address.field.text=model.location;
    _size.field.text=model.size;
    _mortgage.field.text=model.mortgage;
    _perPrice.field.text=model.perPriece;
    _totalPrice.field.text=model.totalPrice;
    _agency.field.text=model.agency;
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
    _photo9.field.text=model.photoI9;
    [_photo9.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo9]];
    _photo9.field.text=model.photoI10;
    [_photo10.imageView sd_setImageWithURL:[NSURL URLWithString:model.photo10]];
    if([_flag isEqualToString:@"check"]){
        _address.flag = YES;
        _size.flag = YES;
        _mortgage.flag = YES;
        _perPrice.flag = YES;
        _totalPrice.flag = YES;
        _agency.flag = YES;
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
        _photo9.flag = YES;
        [_photo9 setButtonNo];
        _photo10.flag = YES;
        [_photo10 setButtonNo];
        
    }
    
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation * currLocation = [locations lastObject];
    CLGeocoder * geo = [[CLGeocoder alloc]init];
    [geo reverseGeocodeLocation:currLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if([placemarks count]>0){
            CLPlacemark *place = placemarks[0];
            NSDictionary *addressDic = place.addressDictionary;
            NSString *state = [addressDic objectForKey:(NSString*)kABPersonAddressStateKey];
            NSString *city = [addressDic objectForKey:(NSString *)kABPersonAddressCityKey];
            NSString *street = [addressDic objectForKey:(NSString *)kABPersonAddressStreetKey];
            NSLog(@"%@%@%@",state,city,street);
        }
    }];
    [_locationManager stopUpdatingLocation];
}

@end
