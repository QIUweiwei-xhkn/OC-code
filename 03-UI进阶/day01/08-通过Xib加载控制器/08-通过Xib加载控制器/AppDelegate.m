//
//  AppDelegate.m
//  08-通过Xib加载控制器
//
//  Created by wei wei on 2024/5/9.
//

#import "AppDelegate.h"
#import "QViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 2.设置窗口的根控制器
    // 2.1通过xib加载控制器中的View
    // initWithNibName:如果指定了特定名称的xib，就会加载指定的xib
    // 如果指定的是nil
        // 1.判断是否有与当前控制器名称相同的xib，若有，自动加载同名的xib（QViewController.xib）
        // 2.若没有，自动加载同名但去掉COntroller的xib（QView.xib）
    
    // init底层会自动调用initWithNibName
    QViewController *vc = [[QViewController alloc] initWithNibName:@"One" bundle:nil];
    vc.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = vc;
    // 3.显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
