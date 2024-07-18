//
//  QRootVC.m
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import "QRootVC.h"
#import "QTabBarViewController.h"
#import "QNewFeatureCollectionViewController.h"
#import "QSaveTool.h"

#define QVersion @"version"

@implementation QRootVC
+ (UIViewController *)chooseRootVC {
    // 当有版本更新，或者第一次安装的时候显示新待性界面
    // 1.获得当前版本号
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
//    NSLog(@"%@",curVersion);
    
    // 获得上一次版本号
//    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:QVersion];
    NSString *lastVersion = [QSaveTool objectForKey:QVersion];
    NSLog(@"%@",lastVersion);
    
    UIViewController *rootVC;
    if(![curVersion isEqualToString:lastVersion]) {
        // 进入新特界面
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        rootVC = [[QNewFeatureCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
//        rootVC.view.backgroundColor = [UIColor redColor];
        // 存储当前版本号
//        [[NSUserDefaults standardUserDefaults] setObject:curVersion forKey:QVersion];
//        // 立即存储
//        [[NSUserDefaults standardUserDefaults] synchronize];
        [QSaveTool setObject:curVersion forKey:QVersion];
        
    }else {
        // 进入主流框架
        rootVC = [[QTabBarViewController  alloc] init];
    }
    
    // 2设置窗口根控制器
    //2.1 创建窗口根控制器
//    UITabBarController *tabBarVC = [[QTabBarViewController  alloc] init];
    
//    UICollectionViewController *rootVC = [[UICollectionViewController alloc] init];
    // 报错 UICollectionView must be initialized with a non-nil layout parameter
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    UICollectionViewController *rootVC = [[QNewFeatureCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
    
    return rootVC;
}
@end
