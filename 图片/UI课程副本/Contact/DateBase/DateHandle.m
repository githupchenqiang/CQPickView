//
//  DateHandle.m
//  Contact
//
//  Created by lanou3g on 15/8/11.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import "DateHandle.h"

@implementation DateHandle
- (void)dealloc
{
    SAFE_RELEASE(_datadict);
    SAFE_RELEASE(_groupArray);
    [super dealloc];
}

+(instancetype)shareDataHandle{
    
       //  static修饰的语句在整个程序声明周期中只运行一次
    static DateHandle *dataHandle = nil;
    if (dataHandle == nil) {
        dataHandle = [self new];
        
           //  伴随单例的创建,数据只初始化一次
        [dataHandle shareData];
    }
    return dataHandle;
}

     //  数据处理
-(void)shareData{
    
    //根据路径获取字典
  NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:PATH];
    
       //  取出字典中的所有key值(分组名)
    self.groupArray = [[[dict allKeys]mutableCopy]autorelease];
    [self.groupArray sortUsingSelector:@selector(compare:)];
    
         //  遍历 找到最内层字典赋值给model 重新组装成model
    self.datadict = [[NSMutableDictionary alloc]initWithCapacity:26];
    
    for (NSString *key in dict) {
        NSArray *array = dict[key];
        
        NSMutableArray *temparray = [[[NSMutableArray alloc]initWithCapacity:20]autorelease];
        for (NSDictionary *dict in array) {
            Person *p = [[Person new]autorelease];
            [p setValuesForKeysWithDictionary:dict];
            [temparray addObject:p];
        }
        [self.datadict setObject:temparray forKey:key];
        
    }
    
    

    
    
}
@end
