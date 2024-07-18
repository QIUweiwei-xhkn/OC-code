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
    
    // 1.UIImageView
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"minion"]];
    [self.scrollView addSubview:imageView];
    
    // 2.设置contentSize
    self.scrollView.contentSize = imageView.frame.size;
    
    // 3.内容的偏移量
    // 作用1：控制内容滚动的位置
    // 作用2：得知内容滚动的位置
//    self.scrollView.contentOffset = CGPointMake(200, 100);
    
    // 4.内边距
    self.scrollView.contentInset = UIEdgeInsetsMake(10, 20, 30, 40);

}

/**
 *  点击控制器的view会自动调用这个方法
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.scrollView.contentOffset = CGPointMake(-100, -100);
}

#pragma mark - 按钮的点击

- (IBAction)top {
    /*
     [UIView animateWithDuration:2.0 animations:^{
 //        CGPoint offset = self.scrollView.contentOffset;
 //        offset.y = 0;
 //        self.scrollView.contentOffset = offset;
         
         self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, 0);
     }];
     */

    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 0) animated:YES];
}

- (IBAction)bottom {
    [UIView animateWithDuration:2.0 animations:^{
        CGPoint offset = self.scrollView.contentOffset;
        offset.y = self.scrollView.contentSize.height - self.scrollView.frame.size.height;
        self.scrollView.contentOffset = offset;
    }];
}
- (IBAction)left {
    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y) animated:YES];
}
- (IBAction)right {
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.frame.size.width, self.scrollView.contentOffset.y) animated:YES];
}
- (IBAction)rightTop {
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.frame.size.width, 0) animated:YES];
}
- (IBAction)leftBottom {
    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentSize.height - self.scrollView.frame.size.height) animated:YES];
}
@end
