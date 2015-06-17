//
//  STextView.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/17.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface STextView : UIView<UITextFieldDelegate>

@property(nonatomic,strong) UILabel *lable;
@property(nonatomic,strong) UITextField *field;

-(void)setLableText:(NSString*)str;
-(void)setFieldText:(NSString*)str;

@end
