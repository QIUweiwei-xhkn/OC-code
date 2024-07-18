//
//  QNavigatonViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/14.
//

#import "QNavigatonViewController.h"

@interface QNavigatonViewController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>
/** 系统手势代理   */
@property(nonatomic, strong) id popGesture ;
@end

@implementation QNavigatonViewController
// 什么时候调用：当程序一启动时调用
// 作用：将当前类加载进内存，放进代码区
//+ (void)load {
//    // 在main函数之前，没有自动缓冲池，需要手动管理内存
//    NSLog(@"%s",__func__);
//}

// 什么时候调用：第一次初始化这个类的时候,如果这个类有子类会多次调用
// 作用：初始化这个类
+ (void)initialize {
//    NSLog(@"%s",__func__);
    // 在当前类，避免有子类后多次调用
    if(self == [QNavigatonViewController class]) {
        // 1.获取导航条标识
        // 获取APP的导航条标识
        // appearance 是一个协议，只要遵守了这协议都有这方法
        // 这样写定义出来的navigationControl样式固定不能修改
    //    UINavigationBar *bar = [UINavigationBar appearance];
        
        // class 获得某几个类的导航条标识
    //    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[UINavigationController class], self]];

    //    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
        
        
        // 创建 UINavigationBarAppearance 对象
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
                                           NSFontAttributeName: [UIFont boldSystemFontOfSize:20]};
        
        // 设置导航条前景色
    //    [bar setTintColor:[UIColor whiteColor]];
        // bar
        // 获得导航条按钮标识
    //    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    //    // 修改返回按钮标题的位置
    //    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
        
        appearance.backgroundImage = [UIImage imageNamed:@"nav"];
        [appearance setShadowImage:[[UIImage alloc] init]];
    //    nav.navigationController.navigationBar.clipsToBounds = YES;
        bar.standardAppearance = appearance;
        bar.scrollEdgeAppearance = appearance;
    //    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:0];
    //    nav.navigationBar.layer.masksToBounds = NO;
        // 导航控制器的上的内容是由栈顶控制器navigationItem
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%s",__func__);
    // 创建 UINavigationBarAppearance 对象
//    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
//    appearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],
//                                       NSFontAttributeName : [UIFont systemFontOfSize:20]};
//
//    appearance.backgroundImage = [UIImage imageNamed:@"nav"];
//    [appearance setShadowImage:[[UIImage alloc] init]];
////    nav.navigationController.navigationBar.clipsToBounds = YES;
//    self.navigationBar.standardAppearance = appearance;
//    self.navigationBar.scrollEdgeAppearance = appearance;
////    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav"] forBarMetrics:0];
////    nav.navigationBar.layer.masksToBounds = NO;
//    // 导航控制器的上的内容是由栈顶控制器navigationItem
    
    // 想要统一设置返回按钮和滑动移除控制器
    // 清空手势代理就能实现滑动返回，ios6不支持
//    self.interactivePopGestureRecognizer.delegate = nil;
//    self.popGesture = self.interactivePopGestureRecognizer.delegate;
//    
//    // 当是根控制器，还原代理，如果是非根控制器，清空代理
    self.delegate = self;
    
    
    // 全屏滑动移除控制器
    // 1.先修改系统的手势，
    /*
     <_UIParallaxTransitionPanGestureRecognizer: 0x104610140; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView: 0x104609ad0>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x104610000>)>>
     */
    // 1.先修改系统的手势，系统没有给我们提供属性
//    NSLog(@"%@", self.interactivePopGestureRecognizer);
//    UIGestureRecognizer *gesture = self.interactivePopGestureRecognizer;
//    // 2.自己添加手势
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleNavigationTransition:)];
//    [self.view addGestureRecognizer:pan];
    
    // 缺Target 系统的私有属性
    // KVC [gest valueForKeyPath:""]:
    // 不知道 Target 真实类型
    // oc runtime 机制 只能动态获取当前类的成员属性，不能获取其子类，或者父类的属性
    // _unsafe_unretained Class要获取哪个类的成员属性
    // unsigned int *outCount获取Class 下面的所有成员属性的个数
//    unsigned int outCount = 0;
//    Ivar *ivars = class_copyIvarList( [UIGestureRecognizer class], &outCount);
//    for (int i = 0; i<outCount; i++) {
//      ivars[il;
//      // 获取成员属性的名字
//      NSString *name = @(ivar_getName(ivars[i]));
//      NSLog (@"%@", name) ; // _targets
//    ｝
    // _targets
//    NSArray   *targets = [gesture valueForKey:@"_targets"];
////    NSLog(@"%@", targets[0]);
//    id target = [targets[0] valueForKey:@"_target"];
    
    id target = self.interactivePopGestureRecognizer.delegate;
    // 2.自己添加手势
    // 禁止系统的手势
    self.interactivePopGestureRecognizer.enabled = NO;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 当是根控制器不让移除（禁止），非根控制器，允许移除控制
    BOOL open = self.viewControllers.count > 1;
    return open;
}

#pragma  mark - UINavigationControllerDelegate
// 当控制器显示完成时调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    NSLog(@"%@", viewController);
    if(self.viewControllers[0] == viewController) {
        // 根控制器 还原代理
        self.interactivePopGestureRecognizer.delegate = self.popGesture;
    }else {
        // 非根控制器 清空代理
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 当非根控制器时隐藏底部的tabBar
    if(self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
    // 当非根控制器设置导航条左侧返回按钮
    if(self.viewControllers.count > 1) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]  initWithImage:[UIImage imageWithRenderOriginalName:@"navBack"] style:0 target:self action:@selector(back)];
    }
}

- (void)back {
    [self popViewControllerAnimated:YES];
}

@end
