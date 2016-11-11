//
//  UserLocation.m
//  CQPickView
//
//  Created by QAING CHEN on 16/11/3.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "UserLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface UserLocation ()<CLLocationManagerDelegate>

  @property (nonatomic ,strong) CLLocationManager *locationManager;
    @property (nonatomic ,strong)NSDictionary     *dict;
@end


@implementation UserLocation

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //聊天气泡
    
    [self initBuble];
   }



- (void)initBuble
{
    CGRect rect = CGRectMake(100, 100, 200, 20);

    UIImageView *image = [[UIImageView alloc]initWithFrame:rect];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = image.bounds;
    layer.contents = (id)[UIImage imageNamed:@"气泡"].CGImage;
    layer.contentsCenter = CGRectMake(0.5, 0.5, 0.1, 0.1);
    layer.contentsScale = [UIScreen mainScreen].scale;
    
    image.layer.mask = layer;
    image.layer.frame = image.frame;
    image.image = [UIImage imageNamed:@"2"];
    [self.view addSubview:image];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0,image.frame.size.width, 20);
    label.text = @"案发可否把加班";
    
    
    
    [image addSubview:label];
    
}



- (void)initCoreLocaltion
{
    if ([CLLocationManager locationServicesEnabled]) {
        
        if (!_locationManager) {
            
            self.locationManager = [[CLLocationManager alloc]init];
            if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                [_locationManager requestWhenInUseAuthorization];
                [_locationManager requestAlwaysAuthorization];
                _locationManager.delegate = self;
                [_locationManager setDistanceFilter:1];
                [_locationManager startUpdatingLocation];
                
            }
            
        }
        
        
    }else
    {
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"提示!" message:@"没有位置权限" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *Cancleaction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        UIAlertAction *quedingAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertControl addAction:Cancleaction];
        [alertControl addAction:quedingAction];
        [self presentViewController:alertControl animated:YES completion:nil];
    }

}




- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
    [manager stopUpdatingLocation];
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [[CLGeocoder alloc]init];
    
    //根据经纬度反向得出位置城市信息
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placeMark = placemarks[0];
        NSString *string  = placeMark.locality;
        
        
//        for (CLPlacemark * placemark in placemarks) {
//            
//            NSDictionary *address = [placemark addressDictionary];
//            
//            //  Country(国家)  State(省)  City（市）
//            NSLog(@"#####%@",address);
//            
//            NSLog(@"====%@", [address objectForKey:@"Country"]);
//            
//            NSLog(@"====%@", [address objectForKey:@"State"]);
//            
//            NSLog(@"====%@", [address objectForKey:@"City"]);
//            
//            NSLog(@"====%@",[address objectForKey:@"Street"]);
//            
//        }
//        
            NSLog(@"%@",placemarks);
            //获取城市信息后 异步更新界面信息
            dispatch_async(dispatch_get_main_queue(), ^{
            
                
            });
            
            
        
    }];
    
    

}



@end
