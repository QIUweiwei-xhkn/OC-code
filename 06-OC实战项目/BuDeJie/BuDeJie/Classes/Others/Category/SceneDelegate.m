//
//  SceneDelegate.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/7.
//

#import "SceneDelegate.h"
#import "QwwAdViewController.h"
#import "QwwMainTabBarController.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // 1.创建窗口
    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    // 2.创建窗口的根控制器
//    QwwAdViewController *adVC = [[QwwAdViewController alloc] init];
    QwwMainTabBarController *mainVC = [[QwwMainTabBarController alloc] init];
    // init ->initWithNibName 1.首先判断有没有指定nibName 2.判断下有没有跟类名同名xib
    self.window.rootViewController = mainVC;
    
    
    // 3.显示窗口
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
