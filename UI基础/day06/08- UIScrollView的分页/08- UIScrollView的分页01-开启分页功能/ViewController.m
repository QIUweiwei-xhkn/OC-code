//
//  ViewController.m
//  08- UIScrollView的分页01-开启分页功能
//
//  Created by wei wei on 2024/2/13.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
/** 计时器   */
@property(nonatomic, weak) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    
    // 1.添加图片
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:@"img_01"];
//    imageView.frame = CGRectMake(0, 0, scrollViewW, scrollViewH);
//    [self.scrollView addSubview:imageView];
//    
//    UIImageView *imageView2 = [[UIImageView alloc] init];
//    imageView2.image = [UIImage imageNamed:@"img_02"];
//    imageView2.frame = CGRectMake(scrollViewW, 0, scrollViewW, scrollViewH);
//    [self.scrollView addSubview:imageView2];
//    
//    UIImageView *imageView3 = [[UIImageView alloc] init];
//    imageView3.image = [UIImage imageNamed:@"img_03"];
//    imageView3.frame = CGRectMake(2 * scrollViewW, 0, scrollViewW, scrollViewH);
//    [self.scrollView addSubview:imageView3];
//    
//    UIImageView *imageView4 = [[UIImageView alloc] init];
//    imageView4.image = [UIImage imageNamed:@"img_04"];
//    imageView4.frame = CGRectMake(3 * scrollViewW, 0, scrollViewW, scrollViewH);
//    [self.scrollView addSubview:imageView4];
    
    // 1.添加图片
    int count = 4;
    for(int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *name = [NSString stringWithFormat:@"img_0%d", i + 1];
        imageView.image = [UIImage imageNamed:name];
        imageView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    
    // 2.设置contentSize
    self.scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    
    // 3.开启分页功能
    // 标准：以scrollView的尺寸为标准
    self.scrollView.pagingEnabled = YES;
    
    // 4.设置总页数
    self.pageControl.numberOfPages = count;
    
    // 5.单页的时候是否隐藏pageControl
//    if(count <= 1) {
////        self.pageControl.alpha = 0;
//        self.pageControl.hidden = YES;
//    }
    self.pageControl.hidesForSinglePage = YES;
    
    //
//    self.pageControl setValue:<#(nullable id)#> forKey:<#(nonnull NSString *)#>
    
    // 6.开启定时器
    [self startTimer];
   
}

// 线程
// 主线程：程序一启动，系统会会默认创建一条线程
// 主线程作用：显示刷新UI界面，处理于用户的交互事件
// 多线程的原理
#pragma mark - 定时器的相关代码
- (void)startTimer {
    // 返回一个自动执行定时器的对象
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage:) userInfo:@"123" repeats:YES];
    
    // NSDefaultRunLoopMode（默认）：同一时间只能执行一个任务
    // NSRunLoopCommonModes（公用）：可以分配一定时间执行其他任务
    // 作用：修改timer在runloop中模式为NSRunLoopCommonModes
    // 目的：不管主线程在做什么操作，都会分配一定的时间处理定时器
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer {
    [self.timer invalidate];
}

/**
 *  滚动到下一页
 */
- (void)nextPage:(NSTimer *)timer {
    NSLog(@"%@", timer.userInfo);
    // 计算下一页的页码
    NSInteger page = self.pageControl.currentPage + 1;
    
    // 超过了最后一页
    if(page == 4) {
        page = 0;
    }
    
    // 滚动到下一页
    [self.scrollView setContentOffset:CGPointMake(page * self.scrollView.frame.size.width, 0) animated:YES];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 计算页码
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    
    // 设置页码
    self.pageControl.currentPage = page;
}

/**
 *   用户开始拖拽scrollView时,停止计时器
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}

/**
 *   用户结束拖拽scrollView时，开启计时器
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}

//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    if(decelerate == NO) {
//        // 计算页码
//        int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
//        
//        // 设置页码
//        self.pageControl.currentPage = page;
//    }
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    // 计算页码
//    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
//    
//    // 设置页码
//    self.pageControl.currentPage = page;
//}
@end
