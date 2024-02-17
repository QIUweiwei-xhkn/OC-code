//
//  ViewController.m
//  01-UIScrollView的基本使用
//
//  Created by wei wei on 2024/2/8.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 红色的View
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(0, 0, 50, 50);
    [self.scrollView addSubview:redView];
    
    // 默认scrollView设置clipsToBounds属性为YES
    self.scrollView.clipsToBounds = YES;
    // 2.设置内容尺寸(滚动范围）
    // 可滚动尺寸：contentSize 的尺寸 减去 scrollView的尺寸
    // 注意点：contentSize的尺寸小于或等于scrollView的尺寸也是不可以滚动的
    self.scrollView.contentSize = CGSizeMake(350, 250);
    
    // 3.是否能滚动
//    self.scrollView.scrollEnabled = NO;
    
    // 4.是否更能跟用户交互（相应用户点击等操作）
    // 注意：设置userInteractionEnabled = NO，scrollView以及内部所有子控件都不能跟用户交互
//    self.scrollView.userInteractionEnabled = NO;
    
//    UIButton *btn = nil;
//    btn.enabled = NO;
//    btn.userInteractionEnabled = NO;
}


@end
