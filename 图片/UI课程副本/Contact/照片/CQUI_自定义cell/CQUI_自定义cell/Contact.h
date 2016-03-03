//
//  Contact.h
//  CQUI_自定义cell
//
//  Created by lanou3g on 15/8/10.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
@property (nonatomic ,retain) NSString *name;
@property (nonatomic ,retain)NSString *gender;
@property (nonatomic ,retain)NSString *phone;
@property (nonatomic ,retain)NSString *age;
@property (nonatomic ,retain)NSString *hobby;
@property (nonatomic ,retain)NSString *imageName;


-(instancetype)initWithName:(NSString *)name
                     gender:(NSString *)gender
                      phone:(NSString *)phone
                      hobby:(NSString *)hobby
                        age:(NSString *)age;





@end
