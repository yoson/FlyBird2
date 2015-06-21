//
//  RemarkInfoModel.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemarkInfoModel : NSObject
@property(nonatomic,strong)NSString*otherInfo;
@property(nonatomic,strong)NSString *photo1;
@property(nonatomic,strong)NSString *photo2;
@property(nonatomic,strong)NSString *photoI1;
@property(nonatomic,strong)NSString *photoI2;
- (void)parseResponse:(NSDictionary *)jsonDict;
@end
