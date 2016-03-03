//
//  MaleTableViewCell.m
//  Contact
//
//  Created by lanou3g on 15/8/11.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import "FemaleTableViewCell.h"

@implementation FemaleTableViewCell

- (void)dealloc
{    SAFE_RELEASE(_person);
    SAFE_RELEASE(_namelabel);
    SAFE_RELEASE(_genderlabel);
    SAFE_RELEASE(_agelabel);
    SAFE_RELEASE(_hobbylabel);
    SAFE_RELEASE(_phonelabel);
    SAFE_RELEASE(_imgView);
    [super dealloc];
}

//重写contact的setter方法,保证外界在赋值的时候model数具可以直接显示在视图上

-(void)setPerson:(Person *)person{
    if (_person != person) {
        [_person release];
        _person = [person retain];
    }
    
    //  在外界赋值时,内部完成model层数据传递给视图
    self.namelabel.text = [NSString stringWithFormat:@"姓名:%@",person.name];
    
    
    self.genderlabel.text = [NSString stringWithFormat:@"性别:%@",person.gender];
    
    self.agelabel.text = [NSString stringWithFormat:@"年龄:%@",person.age];
    
    self.phonelabel.text = [NSString stringWithFormat:@"电话:%@",person.phone];
    
    
    self.hobbylabel.text = [NSString stringWithFormat:@"爱好:%@",person.hobby];
    
    
}




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self drawView];
    }
    return self;
}




//绘制

-(void)drawView{
    self.imgView = [[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 150, 200)]autorelease];
    [self.contentView addSubview:self.imgView];
    
    self.namelabel = [[[UILabel alloc]initWithFrame:CGRectMake(170, 10, 175, 50)]autorelease];
    [self.contentView addSubview:self.namelabel];
    
    self.genderlabel = [[[UILabel alloc]initWithFrame:CGRectMake(170, 60, 175, 50)]autorelease];
    [self.contentView addSubview:self.genderlabel];
    
    self.agelabel = [[[UILabel alloc]initWithFrame:CGRectMake(170, 110, 175, 50)]autorelease];
    [self.contentView addSubview:self.agelabel];
    
    self.phonelabel = [[[UILabel alloc]initWithFrame:CGRectMake(175, 160, 175, 50)]autorelease];
    [self.contentView addSubview:self.phonelabel];
    
    self.hobbylabel = [[[UILabel alloc]initWithFrame:CGRectMake(10, 220, 335, 0)]autorelease];
    _hobbylabel.numberOfLines = 0;
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
