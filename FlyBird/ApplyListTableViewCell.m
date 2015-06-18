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
        _borrowerName = [[UILabel alloc]initWithFrame:CGRectMake(10,40,120,25)];
        _borrowerName.font = [UIFont systemFontOfSize:14];
        _loanamount = [[UILabel alloc]initWithFrame:CGRectMake(10,65,120,25)];
        _loanamount.font = [UIFont systemFontOfSize:14];
         UIView * line2 = [FlyBirdTool getMinCutLine:CGPointMake(0, 95)];
        _create_time = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 200, 15)];
        _create_time.font = [UIFont systemFontOfSize:12];
        _create_time.alpha = 0.3;
        _borrowerphone = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-10-40, 45, 40, 40)];
        [_borrowerphone setBackgroundImage:[UIImage imageNamed:@"telphone.png"] forState:UIControlStateNormal];
        [_borrowerphone addTarget:self action:@selector(dial) forControlEvents:UIControlEventTouchUpInside];
        

        [self addSubview:_borrowerphone];
        [self addSubview:_create_time];
        [self addSubview:line2];
        [self addSubview:_loanamount];
        [self addSubview:_borrowerName];
        [self addSubview:line1];
        [self addSubview:line];
        [self addSubview:_id];
        [self addSubview:_status];
    }
    return self;
}

-(void)dial{
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",_number];
    UIWebView * callWebview = [[UIWebView alloc] init];
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self addSubview:callWebview];
}

-(void)setData:(ApplyListModel *)data{
    _id.text = [NSString stringWithFormat:@"申请编号:%@",data.id];;
    _status.text = [FlyBirdTool formatStatus:data.status];
    _borrowerName.text = [NSString stringWithFormat:@"申请人:%@",data.borrowername];
    _loanamount.text =[NSString stringWithFormat:@"申请金额:%@",data.loanamount];
    _create_time.text = [NSString stringWithFormat:@"申请时间:%@",data.create_time];
    _number = data.borrowerphone;
    _applyId = data.id;
    
}

+(CGFloat)height{
    return 120;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
