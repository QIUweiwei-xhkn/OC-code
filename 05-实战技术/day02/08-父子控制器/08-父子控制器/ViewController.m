//
//  ViewController.m
//  08-父子控制器
//
//  Created by wei wei on 2024/8/1.
//

#import "ViewController.h"
#import "SocietyViewController.h"
#import "TopLineViewController.h"
#import "HotViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *titleContainView;
@property (weak, nonatomic) IBOutlet UIView *containView;

/** 社会   */
@property(nonatomic, strong) SocietyViewController *societyVC;
/** 头条   */
@property(nonatomic, strong) TopLineViewController *topLineVC;
/** 热点   */
@property(nonatomic, strong) HotViewController *hotVC;
@end

@implementation ViewController

/*
     父子控制器：多控制器管理，导航控制器，UITabBarController
     默认UITabBarController，实现这种效果，父子实战
     永远只会显示一个view，把之前的view移除
 
     UITabBarController有个专门存放子控制器view，占位视图思想，
        1.不用去考虑子控制器的view尺寸
        2.屏幕适配也不用管理
 
     1.添加所有子控制器
     2.设置对应按钮的内容，按钮内容由对应子控制器
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.添加所有子控制器
    [self setupAllViewController];
    // 2.设置对应按钮的内容
    [self setTitleButton];
}

// 设置按钮内容
- (void)setTitleButton {
    NSInteger count = self.titleContainView.subviews.count;
    for(int i = 0; i < count; i++) {
        UIButton *btn = self.titleContainView.subviews[i];
        UIViewController *vc = self.childViewControllers[i];
        [btn setTitle:vc.title forState:UIControlStateNormal];
    }
    
}

// 添加所有的子控件
- (void)setupAllViewController {
    // 社会
    SocietyViewController *societyVC = [[SocietyViewController alloc] init];
    societyVC.title = @"社会";
    [self addChildViewController:societyVC];
    // 头条
    TopLineViewController *topLineVC = [[TopLineViewController alloc] init];
    topLineVC.title = @"头条";
    [self addChildViewController:topLineVC];
    // 热点
    HotViewController *hotVC = [[HotViewController alloc] init];
    hotVC.title = @"热点";
    [self addChildViewController:hotVC];
}

// 点击按钮
- (IBAction)showChildVCView:(UIButton *)sender {
    // 移除之前的view
    [self.containView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    for (UIView *view in self.containView.subviews) {
//        [view removeFromSuperview];
//    }
    
    // 把对应子控制器的view添加上去
    UIViewController *vc = self.childViewControllers[sender.tag - 1];
    vc.view.backgroundColor = [sender backgroundColor];
    vc.view.frame = self.containView.bounds;
    [self.containView addSubview:vc.view];
}



/*
 1.控制器每次都需要创建
 2.控制器的view每次都加上去
 3.控制器不能处理业务逻辑，控制器被销毁
 */
//// 目前还没有用到父子控制器
//// 点击社会
//- (IBAction)SocietyBtnClick:(UIButton *)sender {
//    // view#ViewController
//    // 为什么view在，viewController不在
//    // 只要没有强引用就会被销毁
//    // 把社会控制器的view添加上去
//    if(_societyVC == nil) {
//        SocietyViewController *vc = [[SocietyViewController alloc] init];
//        vc.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
//        vc.view.backgroundColor = [sender backgroundColor];
//        _societyVC = vc;
//    }
//    // addSubview：把一个View加上，先要判断这个view有没有父控件，如果有则会拿到这个view的父控件先把父控件的该类型view移除再添加
//    [self.view addSubview:_societyVC.view];
//}
//
//// 点击头条
//- (IBAction)topLineBtnClick:(id)sender {
//    if(_topLineVC == nil) {
//        TopLineViewController *vc = [[TopLineViewController alloc] init];
//        vc.view.backgroundColor = (__bridge UI_APPEARANCE_SELECTOR UIColor *)([sender backgroundColor]);
//        vc.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
//        _topLineVC = vc;
//    }
//    [self.view addSubview:_topLineVC.view];
//}
//
//// 点击热点
//- (IBAction)hotBtnClick:(id)sender {
//    if(_hotVC == nil) {
//        HotViewController *vc = [[HotViewController alloc] init];
//        vc.view.backgroundColor = (__bridge UI_APPEARANCE_SELECTOR UIColor *)([sender backgroundColor]);
//        vc.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);
//        _hotVC = vc;
//    }
//    [self.view addSubview:_hotVC.view];
//}


@end
