//
//  ViewController.m
//  CQPickView
//
//  Created by chenq@kensence.com on 16/3/3.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSDictionary *_dic;//省份 城市
    NSArray *_CountryArray; //省数组
    NSArray *_CityArray; //市数组
    
    
}
@property (nonatomic ,strong)NSArray *DataArray;
@property (nonatomic ,strong)UIPickerView *pickView;
@property (nonatomic ,strong)UILabel *Countrylabel;
@property (nonatomic ,strong)UILabel *CityLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加视图
    [self DrawLabel];
    [self Plistdata];
    [self DrawPickView];
    
}

- (void)DrawLabel
{

    _Countrylabel = [[UILabel alloc]init];
    _Countrylabel.frame = CGRectMake(70, 100, 100, 50);
    _Countrylabel.layer.cornerRadius = 10;
    _Countrylabel.layer.masksToBounds = YES;
    _Countrylabel.layer.borderWidth = 1;
    _Countrylabel.layer.borderColor = [UIColor blackColor].CGColor;
    _Countrylabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_Countrylabel];
    
    
    _CityLabel = [[UILabel alloc]init];
    _CityLabel.frame = CGRectMake(170, 100, 100, 50);
    _CityLabel.layer.cornerRadius = 10;
    _CityLabel.layer.masksToBounds = YES;
    _CityLabel.layer.borderWidth = 1;
    _CityLabel.textAlignment = NSTextAlignmentCenter;
    _CityLabel.layer.borderColor = [UIColor blackColor].CGColor;
    [self.view addSubview:_CityLabel];
    
    
    
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

//添加pickView
- (void)DrawPickView
{
    _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(70, 300, 200, 150)];
    _pickView.layer.cornerRadius = 10;
    _pickView.layer.masksToBounds = YES;
    _pickView.backgroundColor = [UIColor cyanColor];
    _pickView.delegate = self;
    _pickView.dataSource = self;
    [self.view addSubview:_pickView];
}




//delegate的代理事件
//分级个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
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
        
        NSString *string = [_CountryArray objectAtIndex:row];
        _Countrylabel.text = string;
        return [_CountryArray objectAtIndex:row];
       
    }else
    {
        
        NSString *CityString = [_CityArray objectAtIndex:0];
        _CityLabel.text = CityString;
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
        
        NSInteger selectedCityIndex = [self.pickView selectedRowInComponent:1];
        
        NSString *selectedCity = [_CityArray objectAtIndex:selectedCityIndex];
        NSString *msg = [NSString stringWithFormat:@"country =%@ , city=%@",selectedCountry,selectedCity];
        NSLog(@"%@",msg);
        _Countrylabel.text = selectedCountry;
        _CityLabel.text = selectedCity;
    }else
    {
          NSInteger selectedCountryIndex = [self.pickView selectedRowInComponent:0];
        
        NSString *selectedCountry = [_CountryArray objectAtIndex:selectedCountryIndex];
        
        NSString *selectedCity = [_CityArray objectAtIndex:row];
        
        
        NSString *msg = [NSString stringWithFormat:@"country =%@ , city=%@",selectedCountry,selectedCity];
        NSLog(@"ele%@",msg);
        _Countrylabel.text = selectedCountry;
        _CityLabel.text = selectedCity;
        
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
    
    return 100;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
