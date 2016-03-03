//
//  Person.m
//  Contact
//
//  Created by lanou3g on 15/8/11.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import "Person.h"

@implementation Person



- (void)dealloc
{
    
    
    
    SAFE_RELEASE(_name);
    SAFE_RELEASE(_gender);
    SAFE_RELEASE(_age);
    SAFE_RELEASE(_hobby);
    SAFE_RELEASE(_phone);
    [super dealloc];
}


-(instancetype)initWithName:(NSString *)name gender:(NSString *)gender phone:(NSString *)phone hobby:(NSString *)hobby age:(NSString *)age{
    if (self = [super init]) {
        _name = name;
        _gender = gender;
        _age = age;
        _phone = phone;
        _hobby = hobby;
        
        _imageName = [NSString stringWithFormat:@"%@,jpg",name];
        
    }
    return self;
    
    
    
}


//重写字典对model的赋值方法
-(void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues{
    for (NSString *key in keyedValues) {
        //  将当前的键值对赋值给当前对象的对应属性
        [self setValue:keyedValues[key] forKey:key];
        
        //  如果name正在赋值将_imgVIewname的值也一同赋上
        _imageName = [NSString stringWithFormat:@"%@.jpg",_name];
    
    
    }
}






-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"KVC异常");
}

//重写打印方法
- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@age:%@gender:%@", _name,_age,_gender];
}

@end
