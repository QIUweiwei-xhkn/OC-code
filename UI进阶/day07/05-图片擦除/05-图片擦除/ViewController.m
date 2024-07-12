//
//  ViewController.m
//  05-图片擦除
//
//  Created by wei wei on 2024/7/10.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageV1.userInteractionEnabled = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageV1 addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    // 获得当前手指的点
    CGPoint cur = [pan locationInView:self.imageV1];
    
    // 确定擦除区域
    CGFloat rectWH = 30;
    CGFloat x = cur.x - rectWH * 0.5;
    CGFloat y = cur.y - rectWH * 0.5;
    CGRect rect = CGRectMake(x, y, rectWH, rectWH);
    
    // 生成一张带有透明擦除区域的图片
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(self.imageV1.bounds.size, NO, 0);
    // 2.把UIImageV1的内容渲染到上下文中
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    [self.imageV1.layer renderInContext:ctf];
    // 3.擦除上下文中指定的区域
    CGContextClearRect(ctf, rect);
    // 4.从上下文中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    self.imageV1.image = newImage;
}
@end
