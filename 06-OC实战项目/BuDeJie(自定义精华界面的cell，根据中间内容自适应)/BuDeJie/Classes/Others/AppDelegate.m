//
//  AppDelegate.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/7.
//

#import "AppDelegate.h"

/*
     优先级：LaunchScreen > LaunchImage
     在xcode配置了，不起作用 1.清空xcode缓存 2.直接删掉程序 重新运行
     如果是通过LaunchImage设置启动界面，那么屏幕的可视范围由图片决定
 
     LaunchScreen:Xcode6开始才有
     LaunchScreen好处：1.自动识别当前真机或者模拟器的尺寸 2.只要让美工提供一个可拉伸图片 3.展示更多东西
 
     LaunchScreen底层实现：把LaunchScreen截屏，生成一张图片，作为启动界面
 */

/*
     项目架构（结构）搭建：主流结构（UITabBarController + 导航控制器）
     -> 项目开发方式 1.storyboard 2.纯代码
 */
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


// 每次程序启动的时候进入广告界面
// 法1.在启动的时候，去加个广告界面 （X）启动界面的根控制器不能设为自定义的控制器
// 法2.启动完成的时候，加个广告界面（展示了启动图片） ✅
/*
     1.程序一启动就进入广告界面.窗口的根控制器设置为广告控制器 ✅
     2.直接往窗口上再加上一个广告界面，等几秒过去了，在去广告界面移除（麻烦，不推荐）
 */
#pragma mark - UISceneSession lifecycle
// 程序启动时调用
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
