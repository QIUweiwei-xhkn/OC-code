//
//  AppDelegate.m
//  01-彩票
//
//  Created by wei wei on 2024/7/13.
//

#import "AppDelegate.h"
#import "QRootVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 新项目
// 1.确定主框架
// 2.确定开发方式
// 3.工程的配置（部署）

// 文件架结构（MVC）
// 1.让更多的功能复用 2.方便多人开发 3.当程序出现bug（该需求）快速定位

// 谁的事情事情谁管理（自己的事情自己做）
// 自定义
/*
1.自定义控制器：一般都需要自定义（处理复杂的业务逻辑）
2.自定义控件；当系统的需求不能满足的时候，一定要先还原系统原有的方法，在增加自己的方法button 文字在左边图片在右边 模型 view
*/

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1.创建窗口
    self.window= [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 设置根控制器
    self.window.rootViewController = [QRootVC chooseRootVC] ;
     
    // 3.显示窗口
    [self.window makeKeyWindow];
    return YES;
}
 

@end
