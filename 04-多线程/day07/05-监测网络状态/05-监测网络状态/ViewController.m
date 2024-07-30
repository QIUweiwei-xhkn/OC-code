//
//  ViewController.m
//  05-监测网络状态
//
//  Created by wei wei on 2024/7/29.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. 获得一个网络状态监测管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    // 2.监听状态的改变
    /*
     AFNetworkReachabilityStatusUnknown          = -1,  未知
     AFNetworkReachabilityStatusNotReachable     = 0,   没有网络
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   蜂窝网络
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   wifi
     */
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
            default:
                break;
        }
    }];
    
    // 开始监听
    [manager startMonitoring];
}


@end
