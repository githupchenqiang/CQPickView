//
//  Person.h
//  Contact
//
//  Created by lanou3g on 15/8/11.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic ,retain)NSString *name;
@property (nonatomic ,retain)NSString *age,*gender,*hobby,*phone,*imageName;



-(instancetype)initWithName:(NSString *)name
                     gender:(NSString *)gender
                      phone:(NSString *)phone
                      hobby:(NSString *)hobby
                        age:(NSString *)age;

@end
