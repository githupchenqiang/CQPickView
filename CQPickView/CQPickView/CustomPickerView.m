//
//  CustomPickerView.m
//  PersonProduct
//
//  Created by QAING CHEN on 16/11/3.
//  Copyright © 2016年 QiangChen. All rights reserved.
//

#import "CustomPickerView.h"
#define KWidth  [UIScreen mainScreen].bounds.size.width


@interface CustomPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSDictionary *_dic;//省份 城市
    NSArray *_CountryArray; //省数组
    NSArray *_CityArray; //市数组
    UIView   *BackView;
    
}
@property (nonatomic ,strong)UIPickerView *pickView;


@end

@implementation CustomPickerView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        [self Plistdata];
        [self initView];
        
    }
    return self;
}



//解析plist文件
- (void)Plistdata
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"cityData 3" ofType:@"plist"];
    _dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    _CountryArray = [_dic allKeys];
    
    NSInteger selectedCountryIndex = [self.pickView selectedRowInComponent:0];
    NSString *selectCountry =  [_CountryArray objectAtIndex:selectedCountryIndex];
    _CityArray = [_dic objectForKey:selectCountry];
}


- (void)initView
{
    
    _pickView = [[UIPickerView alloc]init];
    CGRect pickerRect = CGRectMake(0,0,self.frame.size.width, self.frame.size.height);
    _pickView.frame = pickerRect;
    _pickView.delegate = self;
    _pickView.dataSource = self;
    _pickView.showsSelectionIndicator = YES;
    [self addSubview:_pickView];
    NSLog(@"%@",NSStringFromCGRect(_pickView.frame));
    BackView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 30)];
    [_pickView addSubview:BackView];
    [self frame:CGRectMake(10, 0, 50, 20) title:@"取消" buttonAction:@selector(CancleAction:)];
    [self frame:CGRectMake(self.frame.size.width - 50, 0, 50, 20) title:@"确定" buttonAction:@selector(quedingAction:)];

}




- (void)CancleAction:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(clickButton:)]) {
        [_delegate performSelector:@selector(clickButton:) withObject:@0];
    }
}

- (void)quedingAction:(UIButton *)sender
{
    if ([_delegate respondsToSelector:@selector(clickButton:)]) {
        [_delegate performSelector:@selector(clickButton:) withObject:@1];
    }
}

- (void)frame:(CGRect)Frame title:(NSString *)string buttonAction:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = Frame;
    [button setTintColor:[UIColor blackColor]];
    [button setTitle:string forState:UIControlStateNormal];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

//delegate的代理事件
//分级个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    NSLog(@"=========%ld",(long)_numberItem);
    return 2;
    
}


//行数据的个数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    if (component == 0) {
        return [_CountryArray count];
    }else
    {
        return [_CityArray count];
    }
    
}

//设置显示的行数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //component表示分级的第几个
    if (component == 0) {
    
        return [_CountryArray objectAtIndex:row];
        
    }else
    {
    
        return [_CityArray objectAtIndex:row];
        
    }
    
}

//获取选中的数据下标
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if (component == 0) {
        NSString *selectedCountry = [_CountryArray objectAtIndex:row];
        _CityArray = [_dic objectForKey:selectedCountry];
        
        //重点！更新市的这一行
        [self.pickView reloadComponent:1];
    
        if ([_delegate respondsToSelector:@selector(slectCountry:)]) {
            [_delegate performSelector:@selector(slectCountry:) withObject:selectedCountry];
        }
    }else
    {
        
        NSString *selectedCity = [_CityArray objectAtIndex:row];

        if ([_delegate respondsToSelector:@selector(selectCity:)]) {
            [_delegate performSelector:@selector(selectCity:) withObject:selectedCity];
        }
    }
    
}
//设置显示组件行的高度

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}


//组件的宽度
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (component == 1) {
        return 100;
    }else
    {
        return 160;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    NSLog(@"%ld",(long)component);
    if (component == 0) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.0,100, 30)];
        
        myView.text = [_CountryArray objectAtIndex:row];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.font = [UIFont systemFontOfSize:14];         //用label来设置字体大小
        
        myView.backgroundColor = [UIColor brownColor];
        
    }else if (component == 1) {
        
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,160, 30)];
        
        myView.text = [_CityArray objectAtIndex:row];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor cyanColor];
        
    }else if (component == 2)
    {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,self.pickView.frame.size.width /_numberItem, 30)];
        
        myView.text = [_CityArray objectAtIndex:row];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor yellowColor];
    }else if(component == 3)
    {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,self.pickView.frame.size.width / _numberItem, 30)];
        
        myView.text = [_CityArray objectAtIndex:row];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor purpleColor];
    }else
    {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,self.pickView.frame.size.width / _numberItem, 30)];
        
        myView.text = [_CityArray objectAtIndex:row];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.font = [UIFont systemFontOfSize:14];
        myView.backgroundColor = [UIColor grayColor];
    }
    
    return myView;
}



- (void)setPickerbackGroudColor:(UIColor *)color
{
    self.pickView.backgroundColor = color;
    BackView.backgroundColor = color;
}

@end
