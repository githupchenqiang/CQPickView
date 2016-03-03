//
//  CQDelegate.m
//  Contact
//
//  Created by lanou3g on 15/8/11.
//  Copyright (c) 2015年 CQ. All rights reserved.
//

#import "CQDelegate.h"

@implementation CQDelegate
- (void)dealloc
{
     SAFE_RELEASE(_IOSWindow);
    [super dealloc];
}

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    
    self.IOSWindow = [[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds]autorelease];
    self.IOSWindow.backgroundColor = [UIColor purpleColor];
    [self.IOSWindow makeKeyAndVisible];
    
    
    //  设置根视图控制器
    
    ListTableViewController *listVC = [[[ListTableViewController alloc]initWithStyle:UITableViewStyleGrouped]autorelease];
    UINavigationController *listNC = [[[UINavigationController alloc]initWithRootViewController:listVC]autorelease];
    [self.IOSWindow setRootViewController:listNC];
    
    
    //
    
    
    
    
    return YES;
}




@end
