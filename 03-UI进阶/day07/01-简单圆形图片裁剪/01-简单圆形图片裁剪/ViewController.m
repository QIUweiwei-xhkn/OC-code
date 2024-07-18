//
//  ViewController.m
//  01-简单圆形图片裁剪
//
//  Created by wei wei on 2024/7/9.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iamgev;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 0.加载图片
    UIImage *image = [UIImage imageNamed:@"1"];
    // 1.开启跟原始图片一样大小的上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 2.设置一个圆形裁剪区域
    // 2.1 绘制一个圆形
    CGFloat radius = image.size.width * 0.5;
    if(image.size.width > image.size.height)
        radius = image.size.height * 0.5;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(image.size.width * 0.5 - radius, image.size.height * 0.5 - radius, radius * 2, radius * 2)];
    // 2.2 把 圆形路径设成裁剪区域
    [path addClip]; // 超过裁剪区域以外的内容都给裁剪掉
    // 3.把图片绘制到上下文当中（超过裁剪区域以外的内容都给裁剪掉）
    [image drawAtPoint:CGPointZero];
    // 4.从上下文当中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    
    self.iamgev.image = newImage;
}


@end
