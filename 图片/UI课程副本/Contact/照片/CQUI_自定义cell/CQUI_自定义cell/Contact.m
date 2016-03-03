//
//  Contact.m
//  CQUI_自定义cell
//
//  Created by lanou3g on 15/8/10.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import "Contact.h"

@implementation Contact
-(void)dealloc{
    [_name release];
    [_gender release];
    [_hobby release];
    [_age release];
    [_phone release];
    [super dealloc];
    
}

   //重写初始化方法
-(instancetype)initWithName:(NSString *)name gender:(NSString *)gender phone:(NSString *)phone hobby:(NSString *)hobby age:(NSString *)age{
    if (self = [super init]) {
        _name = name;
        _gender = gender;
        _phone = phone;
        _hobby = hobby;
        _age = age;
        
        
        _imageName = [NSString stringWithFormat:@"%@.jpg",name];
    }
    return self;
}



//kvc的异常处理

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"不识别的key值");
}

//重写字典对model的赋值方法
-(void)setValuesForKeysWithDictionary:(NSDictionary *)keyedValues{
    //遍历数组
    for (NSString *key in keyedValues) {
        //将字典的键值对赋值给当前对象的对应属性
        [self setValue:keyedValues[key] forKey:key];
        
        //如果正在给name赋值,将imageName的值也一同附上
        if ([key isEqualToString:@"name"]) {
            _imageName = [NSString stringWithFormat:@"%@.jpg",_name];
        }
    }
}



//重写打印方法
- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@,age:%@,gender:%@", _name , _age,_gender];
}










@end
