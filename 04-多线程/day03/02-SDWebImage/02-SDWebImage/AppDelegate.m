//
//  AppDelegate.m
//  02-SDWebImage
//
//  Created by wei wei on 2024/7/22.
//

#import "AppDelegate.h"
#import "SDWebImage/SDWebImageManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    // 1.清空缓存
    // clearDisk：直接删除，然后重新创建
    // cleanDisk：清除过期缓存，计算当前缓存的大小，和设置的最大缓存数量比较，如果超出那么会继续
    // 删除（按照文件了创建的先后顺序）
    // 过期：7天
    [[SDWebImageManager sharedManager].imageCache clearDisk];
    
    // 2.取消当前的所有操作
    [[SDWebImageManager sharedManager] cancelAll];
    
    // 3.最大并发数量 == 6
    // 4.缓存文件的保存名称如何处理？ 拿到图片的URL路径，对该路径进行MD5加密
    // 5.该框架内部对内存警告的处理方式？ 内部通过监听通知的方式清理缓存
    // 6.该框架进行缓存处理的方式：之前使用可变字典 该框架用NSCache
    // 7.如何判断图片的类型  在判断图片类型的时候，只匹配第一个字节
    // 8.队列中任务的处理方式：FIFO
    // 9.如何下载图片的？   发送网络请求下载图片，NSURLConnection
    // 10.请求超时的时间 15秒
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
