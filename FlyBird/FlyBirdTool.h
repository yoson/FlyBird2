//
//  FlyBirdTool.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+Hex.h"
#define QUALITY 0.2
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define YELLOW [UIColor colorWithHex:0xF5A64A]
#define GRAY [UIColor colorWithHex:0xC9C9C9]
#define SETBACKG self.view.backgroundColor=YELLOW;

typedef void (^HandlerBlock) (NSData *data,NSURLResponse *response,NSError *error);


@interface FlyBirdTool : NSObject
+(NSString *) formatStatus:(NSString*)status;
+(NSURL *)stringToUrl:(NSString *)param;
+(NSString *)md5:(NSString *)param;
+(NSString *)getTsTK;
+(NSString *)getValue:(NSString *)key;
+(BOOL)setKey:(NSString *)key Value:(NSString *)value;
+(void)httpPost:(NSString *)url param:(NSString *)param completeHander:(HandlerBlock)handler;
+(UIView*)getMaxCutLine:(CGPoint)frame;
+(UIView*)getMinCutLine:(CGPoint)frame;
+(UILabel*)getTitleLable:(CGPoint)frame setTitle:(NSString*)title;

@end
