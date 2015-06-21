//
//  BasicInfoModel.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "BasicInfoModel.h"

@implementation BasicInfoModel
- (void)parseResponse:(NSDictionary *)jsonDict{
    self.id = [jsonDict objectForKey:@"id"];
    self.borrowername = [jsonDict objectForKey:@"borrowername"];
    self.loanamount = [jsonDict objectForKey:@"loanamount"];
    self.loanuse = [jsonDict objectForKey:@"loanuse"];
    self.repaysource = [jsonDict objectForKey:@"repaysource"];
    self.avgmonthbill = [jsonDict objectForKey:@"avgmonthbill"];
    self.loanmonths = [jsonDict objectForKey:@"loanmonths"];
    self.creditoverview = [jsonDict objectForKey:@"creditoverview"];
    self.borrowerphone = [jsonDict objectForKey:@"borrowerphone"];
    self.borrowerage = [jsonDict objectForKey:@"borrowerage"];
    self.borrowerid = [jsonDict objectForKey:@"borrowerid"];
    self.borrowermarrage = [jsonDict objectForKey:@"borrowermarrage"];
    self.borrowersex = [jsonDict objectForKey:@"borrowersex"];
    self.borroweraddr = [jsonDict objectForKey:@"borroweraddr"];
    self.borrowerwork = [jsonDict objectForKey:@"borrowerwork"];
    self.coborrowername = [jsonDict objectForKey:@"coborrowername"];
    self.coborrowerphone = [jsonDict objectForKey:@"coborrowerphone"];
    self.coborrowerage = [jsonDict objectForKey:@"coborrowerage"];
    self.coborrowerid = [jsonDict objectForKey:@"coborrowerid"];
    self.coborrowerrelation = [jsonDict objectForKey:@"coborrowerrelation"];
    self.coborrowersex = [jsonDict objectForKey:@"coborrowersex"];
    self.coborroweraddr = [jsonDict objectForKey:@"coborroweraddr"];
    self.guarantorname = [jsonDict objectForKey:@"guarantorname"];
    self.guarantorphone = [jsonDict objectForKey:@"guarantorphone"];
    self.guarantorage = [jsonDict objectForKey:@"guarantorage"];
    self.guarantorid = [jsonDict objectForKey:@"guarantorid"];
    self.guarantorrelation = [jsonDict objectForKey:@"guarantorrelation"];
    self.guarantorsex = [jsonDict objectForKey:@"guarantorsex"];
    self.guarantoraddr = [jsonDict objectForKey:@"guarantoraddr"];
}
@end
