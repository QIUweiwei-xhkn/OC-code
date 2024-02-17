//
//  ViewController.m
//  02-展示大图片
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
//    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
//    indicatorView.center = CGPointMake(100, -40);
//    [indicatorView startAnimating];
//    [self.scrollView addSubview:indicatorView];
    
    // 1.UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minion"]];
    [self.scrollView addSubview:imageView];
    
    // 2.设置contentSize
    self.scrollView.contentSize = imageView.frame.size;
    
    // 3.是否有弹簧效果
//    self.scrollView.bounces = NO;
    
    // 4.不管有没有设置contentSize，总是有弹簧效果（下拉效果）
//    self.scrollView.alwaysBounceHorizontal = YES;
//    self.scrollView.alwaysBounceVertical = YES;
    
    // 5.是否显示滚动条
//    self.scrollView.showsHorizontalScrollIndicator = YES;
//    self.scrollView.showsVerticalScrollIndicator = YES;
    
//    NSLog(@"%@", self.scrollView.subviews);
    
    // 注意：千万不要通过索引去subviews数组访问scrollView子控件
    [self.scrollView.subviews.firstObject removeFromSuperview];
}


@end
