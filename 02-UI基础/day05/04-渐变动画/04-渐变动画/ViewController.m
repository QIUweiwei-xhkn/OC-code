//
//  ViewController.m
//  04-渐变动画
//
//  Created by wei wei on 2024/2/5.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *orangeVIew;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/**
 *  平移
 */
- (IBAction)tanslate {
    // 渐变动画
    // 方式一
    /*
     // 1.开始动画
     [UIView beginAnimations:nil context:nil];
     [UIView setAnimationDuration: 1.0];
     
     // 2.动画代码
     CGRect frame = self.orangeVIew.frame;
     frame.origin.x += 100;
     self.orangeVIew.frame = frame;
     
     // 3.提交动画
     [UIView commitAnimations];
     */
    
    // 方式二
    /*
     [UIView animateWithDuration:2.0 animations:^{
         // 1.动画代码
         CGRect frame = self.orangeVIew.frame;
         frame.origin.y += 50;
         self.orangeVIew.frame = frame;
     }];
     */
    
    // 方式三
    /*
     [UIView animateWithDuration:1.0 animations:^{
         // 执行动画
         CGRect frame = self.orangeVIew.frame;
         frame.origin.x -= 50;
         self.orangeVIew.frame = frame;
     } completion:^(BOOL finished) {
         // 动画结束做什么事情
         self.orangeVIew.backgroundColor = [UIColor redColor];
     }];
     */
    
    // 方式四
    /**  options
     *  UIViewAnimationOptionCurveEaseInOut            动画开始/结束比较缓慢，中间相对较快
     *  UIViewAnimationOptionCurveEaseIn                  动画开始比较缓慢
     *  UIViewAnimationOptionCurveEaseOut               动画结束比较缓慢
     *  UIViewAnimationOptionCurveLinear                   线性--->匀速
     */
    
    [UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect frame = self.orangeVIew.frame;
        frame.origin.x -= 50;
        self.orangeVIew.frame = frame;
    } completion:^(BOOL finished) {
        self.orangeVIew.backgroundColor = [UIColor blueColor];
    }];
}

/**
 *  缩放
 */
- (IBAction)scale {
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = self.orangeVIew.frame;
        frame.size = CGSizeMake(200, 100);
        self.orangeVIew.frame = frame;
    } completion:^(BOOL finished) {
        NSLog(@"动画结束");
    }];
}

/**
 *  透明度动画
 */
- (IBAction)alpha {
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.orangeVIew.alpha -= 0.9;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 animations:^{
            self.orangeVIew.alpha += 0.9;
        }];
    }];
}

@end
