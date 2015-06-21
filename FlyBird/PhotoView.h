//
//  PhotoView.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/20.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface PhotoView : UIView<UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,MBProgressHUDDelegate>
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UITextField *field;
@property(nonatomic,weak) UIViewController *controller;
//@property(nonatomic,weak) UIImagePickerController *pickerImage;
@property(nonatomic,strong)UIButton *button;
@property(nonatomic,strong)NSData *imageData;
@property(nonatomic,strong)NSString *type;
@property(nonatomic,strong)NSString *detail;
@property(nonatomic)BOOL flag;
-(void)setButtonNo;
@end
