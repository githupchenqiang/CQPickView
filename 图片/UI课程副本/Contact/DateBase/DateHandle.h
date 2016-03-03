//
//  DateHandle.h
//  Contact
//
//  Created by lanou3g on 15/8/11.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateHandle : NSObject

@property (nonatomic ,retain)NSMutableDictionary *datadict;
@property (nonatomic ,retain)NSMutableArray *groupArray;


+(instancetype)shareDataHandle;


@end
