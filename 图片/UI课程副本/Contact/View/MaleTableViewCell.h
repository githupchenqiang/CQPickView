//
//  MaleTableViewCell.h
//  Contact
//
//  Created by lanou3g on 15/8/11.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaleTableViewCell : UITableViewCell

//  绑定的动态model对象

@property (nonatomic ,retain) Person *person;
@property (nonatomic ,retain)UILabel *namelabel,*genderlabel,*agelabel,*hobbylabel,*phonelabel;

@property (nonatomic ,retain)UIImageView *imgView;



@end
