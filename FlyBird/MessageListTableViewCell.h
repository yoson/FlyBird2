//
//  ApplyListTableViewCell.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/14.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageListModel.h"

@interface MessageListTableViewCell : UITableViewCell
@property(strong,nonatomic)UILabel *id;
@property(strong,nonatomic)UILabel *suggest;
@property(strong,nonatomic)UILabel *status;
@property(strong,nonatomic)UILabel *create_time;
@property(nonatomic,strong)UILabel *detail;
@property(nonatomic)BOOL flag;
-(void)setData:(MessageListModel *)data;
+(CGFloat)height;
@end
