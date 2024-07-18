//
//  ViewController.m
//  07- 利用UIScrollView实现内容缩放
//
//  Created by wei wei on 2024/2/13.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
/** 图片   */
@property(nonatomic, weak) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minion"]];
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    
    // 2.设置contentSize
    self.scrollView.contentSize = imageView.frame.size;
    
    // 3.设置缩放比例
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 4.0;
}

#pragma mark - UIScrollViewDelegate
/**
 *  返回需要缩放的子控件（ scrollView 的子控件)
 */
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollViewn {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidZoom");
}
@end
