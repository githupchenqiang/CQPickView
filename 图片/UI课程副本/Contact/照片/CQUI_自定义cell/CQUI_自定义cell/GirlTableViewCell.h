//
//  BoyTableViewCell.h
//  CQUI_自定义cell
//
//  Created by lanou3g on 15/8/10.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@interface GirlTableViewCell : UITableViewCell
@property (nonatomic ,retain)Contact *contact;
@property (nonatomic ,retain)UIImageView *imgView;
@property (nonatomic ,retain)UILabel *namelabel,*genderlabel,*agelabel,*phonelabel,*hobbylabel;








@end
