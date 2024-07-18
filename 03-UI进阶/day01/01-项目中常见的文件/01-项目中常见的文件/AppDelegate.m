//
//  AppDelegate.m
//  01-项目中常见的文件
//
//  Created by wei wei on 2024/4/21.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

/**
 *  LaunchScreen.storyboard 是用来设计启动界面的，如果没有设置启动界面，Xcode7中默认为4s的屏幕大小
 *
 *  Info.plist 作用：设置应用程序的配置信息，它是一个字典
 *  // 这几个在现在的Info.plist 没了
 *  Bundle name ：应用程序的名字
 *  Bundle identifier:  引用程序唯一的标识
 *  Bundle  version string，short：版本号
 *  Bundle version: 应用程序打包的版本
 *
 *  PCH文件作用：
 *      1.存放一些共有的宏
 *      2.导入一些公用的头文件
 *      3.自定义Log
 *   原理：工程在编译过程中，把PCH文件中的所有内容导入到工程当中所有文件当中
 */

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
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
