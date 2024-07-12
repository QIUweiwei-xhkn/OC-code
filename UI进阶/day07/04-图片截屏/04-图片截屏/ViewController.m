//
//  ViewController.m
//  04-图片截屏
//
//  Created by wei wei on 2024/7/10.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
/** 手指的起始点   */
@property(nonatomic, assign) CGPoint startP;
/** <#注释#>   */
@property(nonatomic, weak) UIView *coverV;
@end

@implementation ViewController
// 懒加载
// 1.能保证始终只有一份
// 2.什么时候调用什么时候加载
- (UIView *)coverV {
    if(_coverV == nil) {
        // 添加一个UIview
        UIView *coverV = [[UIView alloc] init];
        coverV.backgroundColor = [UIColor blackColor];
        coverV.alpha = 0.3;
        _coverV = coverV;
        [self.view addSubview:coverV];
    }
    return _coverV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageV.userInteractionEnabled = YES;
}

- (IBAction)pan:(UIPanGestureRecognizer *)pan {
    
//    NSLog(@"%s",__func__);
    CGPoint curP = [pan locationInView:self.imageV];
    if(pan.state == UIGestureRecognizerStateBegan) {
        self.startP = curP ;
    }else if(pan.state == UIGestureRecognizerStateChanged) {
        CGFloat x = self.startP.x;
        CGFloat y = self.startP.y;
        CGFloat width = curP.x - self.startP.x;
        CGFloat height = curP.y - self.startP.y;
        CGRect rect = CGRectMake(x, y, width, height);
        
        self.coverV.frame = rect;
    }else if(pan.state == UIGestureRecognizerStateEnded) {
        // 把超过coverV的frame外区域裁剪掉
        // 生成一张新的图片把原来的图片替换掉
        UIGraphicsBeginImageContextWithOptions(self.imageV.bounds.size, NO, 0);
        // 把imageV绘制到上下文之前，设置一个裁剪区域
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:self.coverV.frame];
        [clipPath addClip];
        // 把当前的imageV渲染到上下文中
        CGContextRef ctf = UIGraphicsGetCurrentContext();
        [self.imageV.layer renderInContext:ctf];
        // 从上下文中生成一张图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        // 关闭上下文
        UIGraphicsEndImageContext();
        
        // 移除遮盖
        [self.coverV removeFromSuperview];
        self.imageV.image = newImage;
    }
    
}


@end
