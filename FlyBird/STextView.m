//
//  STextView.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/17.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "STextView.h"
#import "FlyBirdTool.h"
#define height 35

@implementation STextView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:CGRectMake(0, frame.origin.y, SCREEN_WIDTH, height)];
    if(self){
        _lable = [[UILabel alloc]initWithFrame:CGRectMake(10,0, 100, height)];
        _lable.font = [UIFont systemFontOfSize:14];
        _field = [[UITextField alloc]initWithFrame:CGRectMake(110,1,SCREEN_WIDTH-110, height)];
        _field.font = [UIFont systemFontOfSize:12];
        _field.placeholder = @"|";
        _field.delegate = self;
        UIView *cutLine = [FlyBirdTool getMinCutLine:CGPointMake(0, height)];
        [self addSubview:cutLine];
        [self addSubview:_lable];
        [self addSubview:_field];
    }
    return  self;
}

-(void)setLableText:(NSString*)str{
    _lable.text = str;
}
-(void)setFieldText:(NSString*)str{
    _field.placeholder = str;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(_flag)
        return NO;
    else
        return YES;
}

@end
