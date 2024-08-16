//
//  QwwNavigationController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/10.
//

#import "QwwNavigationController.h"

@interface QwwNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation QwwNavigationController
+ (void)load {
    // 只要是通过模型设置，都是通过富文本设置
    // 设置顶部条标签 -> UINavigationBar
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setBackgroundImage:[UIImage imageRenderOriginalWithImageName:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [bar setTitleTextAttributes:attrs];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 必须在转跳前调用
//    self.hidesBottomBarWhenPushed = YES;
    
//    NSLog(@"%@", self.interactivePopGestureRecognizer.delegate);    // <_UINavigationInteractiveTransition: 0x10650f1c0> 手势代理
    
    // 假死状态：程序还在运行，但是界面死了．
    // 边缘滑动
//    UIScreenEdgePanGestureRecognizer *edgePan = self.interactivePopGestureRecognizer;
//    edgePan.edges = UIRectEdgeAll;
    
    /*
     <_UIParallaxTransitionPanGestureRecognizer: 0x105a19ac0; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView: 0x105a17ca0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x105a19980>)>>
     */
    // 全面滑动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate  action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    // 控制手势什么时候触发，只有非根控制器才需要触发手势
    pan.delegate = self;
    // 禁止系统手势
    self.interactivePopGestureRecognizer.enabled = NO ;
//    self.interactivePopGestureRecognizer.delegate = self;
}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 恢复滑动返回功能 ->分析：把系统的返回按钮覆盖 -> 1.手势失效（1.手势被清空 2.可能手势代理做了一些事情，导致手势失效）
    if(self.childViewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] WithSelectedImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // 真正的转跳
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.childViewControllers.count > 1;
}

#pragma mark - 点击返回按钮
- (void)back {
    [self popViewControllerAnimated:YES];
}
@end
