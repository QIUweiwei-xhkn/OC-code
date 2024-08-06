//
//  ViewController.m
//  07-UIScrollView底层实现
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
/** <#注释#>   */
//@property(nonatomic, weak) UIScrollView *scrollView;
@property(nonatomic, weak) UIView *scrollView;
@end

@implementation ViewController

 // 模仿系统控件 => 怎么去使用 =>滚动sCrollView，其实本质滚动内容 => 改bounds => 验证
 // => 手指往上拖动，bounds y++，内容才会往上走

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    // 模仿系统的UIScrollView
    UIView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    scrollView.contentSize = CGSizeMake(0, 1000);
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [scrollView addGestureRecognizer:pan];
    
    UISwitch *switchView = [[UISwitch alloc] init];
    [scrollView addSubview:switchView];
    
//    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    _scrollView = scrollView;
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    // 获得偏移量
    CGPoint point = [pan translationInView:pan.view];
    // 修改bounds
    CGRect bounds = _scrollView.bounds;
    bounds.origin.y -= point.y;
    _scrollView.bounds = bounds;
//    NSLog(@"%@", NSStringFromCGPoint(point));
    
    // 复位
    [pan setTranslation:CGPointZero inView:pan.view];
}

#pragma mark - UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%@", NSStringFromCGRect(_scrollView.bounds));
//    NSLog(@"%@", NSStringFromCGPoint(_scrollView.contentOffset));
//}
@end
