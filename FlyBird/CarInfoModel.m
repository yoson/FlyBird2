//
//  CarInfoModel.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "CarInfoModel.h"

@implementation CarInfoModel
- (void)parseResponse:(NSDictionary *)jsonDict{
    self.carid = [jsonDict objectForKey:@"carid"];
    self.mileage = [jsonDict objectForKey:@"mileage"];
    self.cartype = [jsonDict objectForKey:@"cartype"];
    self.fueltype = [jsonDict objectForKey:@"fueltype"];
    self.carbrand = [jsonDict objectForKey:@"carbrand"];
    self.emissions = [jsonDict objectForKey:@"emissions"];
    id obj = [jsonDict objectForKey:@"buyprice"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.buyprice = obj;
    }
    obj = [jsonDict objectForKey:@"buytime"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.buytime = obj;
    }
    obj = [jsonDict objectForKey:@"assessedprice"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.assessedprice = obj;
    }
    obj = [jsonDict objectForKey:@"assessedagency"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.assessedagency = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo1 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs2"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo2 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs3"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo3 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs4"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo4 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs5"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo5 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs6"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo6 = obj;
    }
    obj = [jsonDict objectForKey:@"otherimgs"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo7 = obj;
    }
    obj = [jsonDict objectForKey:@"otherimgs2"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo8 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgsinfo"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI1 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs2info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI2 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs3info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI3 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs4info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI4 = obj;
    }
    obj = [jsonDict objectForKey:@"carimg5info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI5 = obj;
    }
    obj = [jsonDict objectForKey:@"carimgs6info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI6 = obj;
    }
    obj = [jsonDict objectForKey:@"otherimgsinfo"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI7 = obj;
    }
    obj = [jsonDict objectForKey:@"otherimgs2info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI8 = obj;
    }
}
@end
