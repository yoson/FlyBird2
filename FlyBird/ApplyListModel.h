//
//  ApplyListModel.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplyListModel : NSObject
@property(nonatomic,strong) NSString *id;
@property(nonatomic,strong) NSString *borrowername;
@property(nonatomic,strong) NSString *borrowerphone;
@property(nonatomic,strong) NSString *status;
@property(nonatomic,strong) NSString *loanamount;
@property(nonatomic,strong) NSString *create_time;
- (void)parseResponse:(NSDictionary *)jsonDict;
@end
