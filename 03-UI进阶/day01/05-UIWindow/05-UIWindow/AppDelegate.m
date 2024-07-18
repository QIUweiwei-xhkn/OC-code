//
//  AppDelegate.m
//  05-UIWindow
//
//  Created by wei wei on 2024/5/8.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/**
 *      1.如果info.plist文件有Mian，会加载Main.storyboard
 *      2.创建一个窗口
 *      3.把Main.storyboard箭头指向的控制器，设为窗口的根控制器
 *      4.显示窗口（把窗口的根控制器的View，添加到窗口）
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 2.一个窗口必须有根控制器（设置窗口的根控制器）
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    self.window.rootViewController = vc;
    
    NSLog(@"%@",[UIApplication sharedApplication].keyWindow);  // 'keyWindow' is deprecated: first deprecated in iOS 13.0 - Should not be used for applications that support multiple scenes as it returns a key window across all connected scenes
    // 3.显示窗口
    [self.window makeKeyAndVisible];
    NSLog(@"%@",[UIApplication sharedApplication].keyWindow); 
    /**
     *   makeKeyAndVisible:
     *   1.设置应用程序的主窗口
     *   2.让窗口显示， 把窗口的hidden = no
     *   3.把窗口的根控制器的view添加到窗口上
     *   [self.window addsubView:rootViewController.View];
     */
    return YES;
    
    // 键盘和状态栏其实也都是window
    // 设置窗口级别 UIWindowLevelAlert > UIWindowLevelStatusBar > UIWindowLevelNormal
//    self.window.windowLevel = UIWindowLevelNormal;
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
