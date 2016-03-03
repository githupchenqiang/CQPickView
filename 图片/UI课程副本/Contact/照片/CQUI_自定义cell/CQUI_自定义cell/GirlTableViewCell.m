//
//  BoyTableViewCell.m
//  CQUI_自定义cell
//
//  Created by lanou3g on 15/8/10.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import "GirlTableViewCell.h"

@implementation GirlTableViewCell
- (void)dealloc
{
    [_namelabel release];
    [_genderlabel release];
    [_agelabel release];
    [_phonelabel release];
    [_imgView release];
    [_hobbylabel release];
    [super dealloc];
}

//cell的初始化方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawView];
    }
        

    return self;
}


//重写contact的setter方法,保证外界赋值的时候model数据可以直接在视图上
-(void)setContact:(Contact *)contact{
    if (_contact != contact) {
        [_contact release];
        _contact = [contact retain];
    }
    
    //在外界赋值时,内部完成model层数据传递给视图
    self.namelabel.text = [NSString stringWithFormat:@"姓名:%@",contact.name];
    self.genderlabel.text = [NSString stringWithFormat:@"性别:%@",contact.gender];
    self.agelabel.text = @"保密";
    self.phonelabel.text = [NSString stringWithFormat:@"电话:%@",contact.phone];
    self.hobbylabel.text = [NSString stringWithFormat:@"爱好:%@",contact.hobby];
    
    
}

- (void)drawView
{
    self.imgView = [[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 150,200)]autorelease];
    [self.contentView addSubview:self.imgView];
    
    self.namelabel = [[[UILabel alloc]initWithFrame:CGRectMake(170, 10, 175, 50)]autorelease];
     self.namelabel.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:self.namelabel];
    
    self.genderlabel = [[[UILabel alloc]initWithFrame:CGRectMake(170, 60, 175, 50)]autorelease];
    [self.contentView addSubview:self.genderlabel];
    
    self.agelabel = [[[UILabel alloc]initWithFrame:CGRectMake(170, 110, 175, 50)]autorelease];
    [self.contentView addSubview:self.agelabel];
    
    self.phonelabel = [[[UILabel alloc]initWithFrame:CGRectMake(170, 160, 175, 50)]autorelease];
    [self.contentView addSubview:self.phonelabel];
    
    self.hobbylabel = [[[UILabel alloc]initWithFrame:CGRectMake(10, 220, 335, 0)]autorelease];
    self.hobbylabel.numberOfLines = 0;
    [self.contentView addSubview:self.hobbylabel];
    
    
    
    
    
    
    
}





















- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
