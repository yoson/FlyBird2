//
//  BasicInfoModel.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicInfoModel : NSObject
@property(nonatomic,strong)NSString *id;
@property(nonatomic,strong)NSString *borrowername;
@property(nonatomic,strong)NSString *loanamount;
@property(nonatomic,strong)NSString *loanuse;
@property(nonatomic,strong)NSString *repaysource;
@property(nonatomic,strong)NSString *avgmonthbill;
@property(nonatomic,strong)NSString *loanmonths;
@property(nonatomic,strong)NSString *creditoverview;
@property(nonatomic,strong)NSString *borrowerphone;
@property(nonatomic,strong)NSString *borrowerage;
@property(nonatomic,strong)NSString *borrowerid;
@property(nonatomic,strong)NSString *borrowermarrage;
@property(nonatomic,strong)NSString *borrowersex;
@property(nonatomic,strong)NSString *borroweraddr;
@property(nonatomic,strong)NSString *borrowerwork;
@property(nonatomic,strong)NSString *coborrowername;
@property(nonatomic,strong)NSString *coborrowerphone;
@property(nonatomic,strong)NSString *coborrowerage;
@property(nonatomic,strong)NSString *coborrowerid;
@property(nonatomic,strong)NSString *coborrowerrelation;
@property(nonatomic,strong)NSString *coborrowersex;
@property(nonatomic,strong)NSString *coborroweraddr;
@property(nonatomic,strong)NSString *guarantorname;
@property(nonatomic,strong)NSString *guarantorphone;
@property(nonatomic,strong)NSString *guarantorage;
@property(nonatomic,strong)NSString *guarantorid;
@property(nonatomic,strong)NSString *guarantorrelation;
@property(nonatomic,strong)NSString *guarantorsex;
@property(nonatomic,strong)NSString *guarantoraddr;
- (void)parseResponse:(NSDictionary *)jsonDict;

@end
