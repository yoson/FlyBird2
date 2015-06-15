//
//  ApplyListTableViewCell.m
//  FlyBird
//
//  Created by yosonyuan on 15/6/14.
//  Copyright (c) 2015年 yosonyuan. All rights reserved.
//

#import "MessageListTableViewCell.h"
#import "FlyBirdTool.h"

@implementation MessageListTableViewCell

- (void)awakeFromNib {
    // Initialization code

}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        UIView * line = [FlyBirdTool getMaxCutLine:CGPointMake(0, 0)];
        _id = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 100, 15)];
        _id.font = [UIFont systemFontOfSize:12];
        _id.alpha = 0.3;
        _status = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-120-10, 15, 120, 15)];
        _status.textAlignment= NSTextAlignmentRight;
        _status.font = [UIFont systemFontOfSize:12];
        _status.textColor=YELLOW;
        UIView *line1 = [FlyBirdTool getMinCutLine:CGPointMake(0, 35)];
        _suggest = [[UILabel alloc]initWithFrame:CGRectMake(10,40,120,25)];
        _suggest.font = [UIFont systemFontOfSize:14];
        _detail = [[UILabel alloc]initWithFrame:CGRectMake(10,65,120,25)];
        _detail.font = [UIFont systemFontOfSize:14];
        _detail.textColor = YELLOW;
         UIView * line2 = [FlyBirdTool getMinCutLine:CGPointMake(0, 95)];
        _create_time = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 200, 15)];
        _create_time.font = [UIFont systemFontOfSize:12];
        _create_time.alpha = 0.3;
        

        [self addSubview:_create_time];
        [self addSubview:line2];
        [self addSubview:_detail];
        [self addSubview:_suggest];
        [self addSubview:line1];
        [self addSubview:line];
        [self addSubview:_id];
        [self addSubview:_status];
    }
    return self;
}


-(void)setData:(MessageListModel *)data{
    _id.text = [NSString stringWithFormat:@"审核编号:%@",data.oid];;
    _status.text = [FlyBirdTool formatStatus:data.newstatus];
    
    _suggest.text = [NSString stringWithFormat:@"申请意见:%@",data.verifycomment];
    _detail.text =[NSString stringWithFormat:@"［查看详情］"];
    _create_time.text = [NSString stringWithFormat:@"申请时间:%@",data.create_time];

    
}

+(CGFloat)height{
    return 120;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
