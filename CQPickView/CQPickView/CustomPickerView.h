//
//  CustomPickerView.h
//  PersonProduct
//
//  Created by QAING CHEN on 16/11/3.
//  Copyright © 2016年 QiangChen. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol selectIndexitemDelegate <NSObject>
@required


/**
 省份选择

 @param country
 */
- (void)slectCountry:(NSString *)country;


/**
 城市选择

 @param city
 */
- (void)selectCity:(NSString *)city;


/**
 取消和确定按钮

 @param number 0 为取消 1 为确定
 */
- (void)clickButton:(NSNumber *)number;
@end



@interface CustomPickerView : UIView

@property (nonatomic ,strong)NSArray *dataArray;
@property (nonatomic ,assign)NSInteger numberItem;

@property (nonatomic ,assign)id<selectIndexitemDelegate>delegate;


/**
 设置picker的背景色

 @param color 
 */
- (void)setPickerbackGroudColor:(UIColor *)color;


@end
