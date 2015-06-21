//
//  CarInfoModel.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarInfoModel : NSObject
@property(nonatomic,strong) NSString*carid;
@property(nonatomic,strong) NSString*mileage;
@property(nonatomic,strong) NSString*cartype;
@property(nonatomic,strong) NSString*fueltype;
@property(nonatomic,strong) NSString*carbrand;
@property(nonatomic,strong) NSString*emissions;
@property(nonatomic,strong) NSString*buytime;
@property(nonatomic,strong) NSString*buyprice;
@property(nonatomic,strong) NSString*assessedprice;
@property(nonatomic,strong) NSString*assessedagency;
@property(nonatomic,strong)NSString *photo1;
@property(nonatomic,strong)NSString *photo2;
@property(nonatomic,strong)NSString *photo3;
@property(nonatomic,strong)NSString *photo4;
@property(nonatomic,strong)NSString *photo5;
@property(nonatomic,strong)NSString *photo6;
@property(nonatomic,strong)NSString *photo7;
@property(nonatomic,strong)NSString *photo8;
@property(nonatomic,strong)NSString *photoI1;
@property(nonatomic,strong)NSString *photoI2;
@property(nonatomic,strong)NSString *photoI3;
@property(nonatomic,strong)NSString *photoI4;
@property(nonatomic,strong)NSString *photoI5;
@property(nonatomic,strong)NSString *photoI6;
@property(nonatomic,strong)NSString *photoI7;
@property(nonatomic,strong)NSString *photoI8;

- (void)parseResponse:(NSDictionary *)jsonDict;
@end
