//
//  MessageListModel.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageListModel : NSObject
@property(strong,nonatomic)NSString *oid;
@property(strong,nonatomic)NSString *newstatus;
@property(strong,nonatomic)NSString *verifycomment;
@property(strong,nonatomic)NSString *create_time;
-(void)parseResponse:(NSDictionary *)dict;



@end
