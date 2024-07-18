//
//  ViewController.m
//  03-UIApplication功能(熟悉)
//
//  Created by wei wei on 2024/4/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
// 这些都过时了……
- (IBAction)bagValue:(id)sender {
    // 设置提醒图标
    // 1.获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    // 2.注册用户通知
    UIUserNotificationSettings *notice = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [app registerUserNotificationSettings:notice];
    app.applicationIconBadgeNumber = 10;
}
- (IBAction)netStatus:(id)sender {
    // 1.获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
}
- (IBAction)StatusBar:(id)sender {
    // 1.获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    // 隐藏状态栏
    app.statusBarHidden = YES;
}
- (IBAction)openURL:(id)sender {
    // 1.获取UIApplication对象
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:@"http://www.520it.com"];
    [app openURL:url];
    
    
}


// 状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
