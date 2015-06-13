//
//  ApplyListTableViewCell.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/14.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "ApplyListTableViewCell.h"
#import "FlyBirdTool.h"

@implementation ApplyListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];
    UIView * line = [FlyBirdTool getMaxCutLine:CGPointMake(0, 0)];
    _id = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 100, 15)];
    _status = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100-10, 5, 100, 15)];
    
}

-(void)setData:(ApplyListModel *)data{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
