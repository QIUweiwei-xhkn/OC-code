//
//  main.m
//  04-应用程序程序原理
//
//  Created by wei wei on 2024/5/8.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    
    // 第三个参数：设置应用程序对象的名称UIApplicatio或是它的类，若是nil，默认为UIApplication
    // 第四个参数：设置UIApplicaition的代理名称
    // NSStringFromClass将类名转换成字符串
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
/**
 *  1.执行main函数
 *  2.执行UIApplicationMain 函数，创建UIapplication对象并设置UIApplication的代理
 *  3. 开启一个事件循环（主运行循环，死循环：保证程序不退出）
 *  4. 取加载info.plist（判断其中是否有Main，如果有，加载Main.storyBoard）
 *  5.应用程序启动完毕（通知代理应用程序启动完毕）
 */
