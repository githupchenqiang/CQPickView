//
//  ViewController.m
//  CQPickView
//
//  Created by chenq@kensence.com on 16/3/3.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic ,strong)NSArray *DataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.DataArray = [NSArray arrayWithObjects:@"陈强",@"绕民警",@"刘轩",@"王川阳",@"苏剑锋",@"李博士", nil];
    
    
    UIPickerView *pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 100, 400, 150)];
    pickView.backgroundColor = [UIColor cyanColor];
    pickView.delegate = self;
    pickView.dataSource = self;
    [self.view addSubview:pickView];
  
    
}


//delegate的代理事件
//分级个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}


//行数据的个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return _DataArray.count;
    
    
}

//设置显示的行数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSLog(@"adad%ld",(long)row);
    
    
    //component表示分级的第几个
    if (component == 0) {
        return [self.DataArray objectAtIndex:row];
        
        
    }else
    {
        return @"无";
        
    }

}


//获取选中的数据下标
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
    NSLog(@"%ld",component);
    
    NSLog(@"%ld,%ld",component,row);
    
}

//设置显示组件行的高度

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}


//组件的宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    
    return 120;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
