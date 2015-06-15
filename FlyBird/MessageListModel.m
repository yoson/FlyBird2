//
//  MessageListModel.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "MessageListModel.h"

@implementation MessageListModel

-(void)parseResponse:(NSDictionary *)dict{
    self.oid = [dict objectForKey:@"oid"];
    self.newstatus = [dict objectForKey:@"newstatus"];
    self.verifycomment = [dict objectForKey:@"verifycomment"];
    self.create_time = [dict objectForKey:@"create_time"];
}
@end
