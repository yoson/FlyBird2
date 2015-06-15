//
//  ApplyListTableViewCell.h
//  FlyBird
//
//  Created by yosonyuan on 15/6/14.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplyListModel.h"

@interface ApplyListTableViewCell : UITableViewCell
@property(strong,nonatomic)UILabel *id;
@property(strong,nonatomic)UILabel *borrowerName;
@property(strong,nonatomic)UILabel *status;
@property(strong,nonatomic)UILabel *create_time;
@property(strong,nonatomic)UILabel *loanamount;
@property(strong,nonatomic)UIButton *borrowerphone;
@property(nonatomic,strong)NSString *number;
-(void)setData:(ApplyListModel *)data;
+(CGFloat)height;
@end
