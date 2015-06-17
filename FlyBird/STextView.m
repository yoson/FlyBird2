//
//  STextView.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/17.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "STextView.h"
#import "FlyBirdTool.h"

@implementation STextView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        _lable = [[UILabel alloc]initWithFrame:CGRectMake(10,0, 100, 40)];
        _field = [[UITextField alloc]initWithFrame:CGRectMake(110,0,SCREEN_WIDTH-110, 40)];
        UIView *cutLine = [FlyBirdTool getMinCutLine:CGPointMake(0, 40)];
        [self addSubview:cutLine];
        [self addSubview:_lable];
        [self addSubview:_field];
    }
    return  self;
}

-(void)setLableText:(NSString*)str{
    _lable.text = str;
    _lable.font = [UIFont systemFontOfSize:14];
}
-(void)setFieldText:(NSString*)str{
    _field.placeholder = str;
    _field.font = [UIFont systemFontOfSize:12];
    _field.delegate = self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
