//
//  ApplyListModel.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "ApplyListModel.h"

@implementation ApplyListModel
-(void)parseResponse:(NSDictionary *)jsonDict{
    self.id = [jsonDict objectForKey:@"id"];
    self.borrowername = [jsonDict objectForKey:@"borrowername"];
    self.borrowerphone = [jsonDict objectForKey:@"borrowerphone"];
    self.status= [jsonDict objectForKey:@"status"];
    self.loanamount = [jsonDict objectForKey:@"loanamount"];
    self.create_time = [jsonDict objectForKey:@"create_time"];
}
@end
