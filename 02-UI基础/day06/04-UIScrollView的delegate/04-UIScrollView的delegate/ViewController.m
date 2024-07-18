//
//  ViewController.m
//  04-UIScrollView的delegate
//
//  Created by wei wei on 2024/2/12.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor redColor];
    scrollView.frame = CGRectMake(0, 20, 300, 200);
    [self.view addSubview:scrollView];
    
    // 注意点：通过代码创建 scrollView，一开始 subviews 这个数组为nil;
//    NSLog(@"%@", scrollView.subviews);
    
    // 1.UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minion"]];
    [scrollView addSubview:imageView];
    
    // 2.设置contentSize
    scrollView.contentSize = imageView.frame.size;
    
    // 3.设置代理
    scrollView.delegate = self;
}

#pragma mark - UIScrollViewDelegate
/**
 *  当scrollView正在滚动时调用这个方法
 */
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidScroll---");
//}

/**
 *  用户开始拖拽 scrollView 时就会调用这个方法
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging---");
}

/**
 *  用户即将结束拖拽 scrollView 时就会调用这个方法
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"scrollViewWillEndDragging---");
}

/**
 *  用户已经结束拖拽 scrollView 时就会调用这个方法
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    NSLog(@"scrollViewDidEndDragging---");
    if(decelerate == NO) {
        NSLog(@"用户已经停止拖拽scrollView，停止滚动");
    }else {
        NSLog(@"用户已经停止拖拽scrollView，但是scrollView由于惯性会继续滚动，减速");
    }
}

/**
 *  scrollView 减少完毕会调用，停止滚动
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"scrollViewDidEndDecelerating---");
    NSLog(@"scrollView减速完毕就会调用，停止滚动");
}
@end
