//
//  UIColor+Hex.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/11.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+(UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)colorWithHex:(NSInteger)hexValue;
+ (UIColor*)colorWithHexString:(NSString*)hexString;
+ (UIColor*)whiteColorWithAlpha:(CGFloat)alphaValue;
+ (UIColor*)blackColorWithAlpha:(CGFloat)alphaValue;
@end
