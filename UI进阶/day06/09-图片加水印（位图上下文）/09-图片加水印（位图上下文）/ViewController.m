//  
//     ViewController.m
//     09-图片加水印（位图上下文）
// 
//   Created by wei wei on 2024/7/9.
// 

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 0.加载图片
    UIImage *image = [UIImage imageNamed:@"yu"];
    // 1.开启一个跟图片原始大小的上下文
    // opaque 不透明度 YES 不透明，NO透明
    UIGraphicsBeginImageContextWithOptions(image.size, NO , 0);
    // 2.把图片绘制到上下文当中
    [image drawAtPoint:CGPointZero];
    // 3.把文字绘制到上下文当中
    NSString *str = @"祁煜--奇遇";
    [str drawAtPoint:CGPointMake(350, 500) withAttributes:nil];
    // 4.从上下文当中生成一张图片.（把上下文当中绘制的所有内容，生成一张图片）
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    
    self.imageV.image = newImage;
}


@end
