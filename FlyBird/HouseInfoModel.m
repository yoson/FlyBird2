//
//  HouseInfoModel.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "HouseInfoModel.h"

@implementation HouseInfoModel
- (void)parseResponse:(NSDictionary *)jsonDict{
    self.location = [jsonDict objectForKey:@"houseaddr"];
    self.size = [jsonDict objectForKey:@"size"];
    self.mortgage = [jsonDict objectForKey:@"mortgage"];
    self.perPriece = [jsonDict objectForKey:@"avgassessedval"];
    self.totalPrice = [jsonDict objectForKey:@"totalval"];
    self.agency = [jsonDict objectForKey:@"assessedagency"];
    id obj = [jsonDict objectForKey:@"houseimgs"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo1 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgs2"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo2 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgs3"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo3 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgs4"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo4 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgs5"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo5 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgs6"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo6 = obj;
    }
    obj = [jsonDict objectForKey:@"investigationimgs"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo7 = obj;
    }
    obj = [jsonDict objectForKey:@"investigationimgs2"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo8 = obj;
    }
    obj = [jsonDict objectForKey:@"otherimgs"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo9 = obj;
    }
    obj = [jsonDict objectForKey:@"otherimgs2"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photo10 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgsinfo"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI1 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgs2info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI2 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgs3info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI3 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgs4info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI4 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimg5info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI5 = obj;
    }
    obj = [jsonDict objectForKey:@"houseimgs6info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI6 = obj;
    }
    obj = [jsonDict objectForKey:@"investigationimgsinfo"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI7 = obj;
    }
    obj = [jsonDict objectForKey:@"investigationimgs2info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI8 = obj;
    }
    obj = [jsonDict objectForKey:@"otherimgsinfo"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI9 = obj;
    }
    obj = [jsonDict objectForKey:@"otherimgs2info"];
    if(obj !=nil && [obj isKindOfClass:[NSString class]]){
        self.photoI10 = obj;
    }
}
@end
