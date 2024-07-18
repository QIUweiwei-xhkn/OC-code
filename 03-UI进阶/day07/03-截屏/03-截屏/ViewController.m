//
//  ViewController.m
//  03-截屏
//
//  Created by wei wei on 2024/7/10.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super viewDidLoad];
    // 把控制器的view生成一张图片
    
    // 1.开启一张和当前控制器的VIew一样大的位图上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    // 2.把控制器的VIew绘制到上下文中
    // 2.想要把UIView上面的东西给绘制到上下文当中，必须得要使用渲染的方式
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctf];  // 渲染
//    [self.view.layer drawInContext:ctf];    // 绘制
    // 3.从上下文中生成一张图片
    UIImage *newImageView = UIGraphicsGetImageFromCurrentImageContext();
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    
    //把生成的图片写入到桌面（文件方式进行传输：二进制流NSData）
    //把图片转成二进制流NSData
//    NSData *data = UIImageJPEGRepresentation(newImageView, 1);
    NSData *data = UIImagePNGRepresentation(newImageView);
    [data writeToFile :@"/Users/weiwei/Desktop/newImage.png" atomically:YES];
    NSLog(@"%s",__func__);
}
@end
