//
//  AppDelegate.m
//  03-UIApplication功能(熟悉)
//
//  Created by wei wei on 2024/4/21.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 应用程序启动完毕时调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s",__func__);
    return YES;
}

// 应用程序将要失去焦点时调用
-(void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

// 应用程序进入到后台时调用
-(void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

// 应用程序进入到前台时调用
-(void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

// 应用程序获得焦点时调用
// 焦点：能否与用户进行交互
-(void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s",__func__);
}

// 当应用程序退出的时候调用
-(void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s",__func__);
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
