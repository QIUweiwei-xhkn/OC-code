//
//  ViewController.m
//  03-UIImage的使用
//
//  Created by wei wei on 2023/12/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
    //毛玻璃效果
    UIImageView *imageview = [[UIImageView alloc] init];
//    imageview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    imageview.frame = self.view.bounds;
    //设置背景颜色
    imageview.backgroundColor = [UIColor redColor];
    
    //设置背景图片
    imageview.image = [UIImage imageNamed:@"fb264ba19f49cdd4c5d656fc691702c3"];
    
    //设置背景内容模式
    imageview.contentMode = UIViewContentModeScaleToFill;
    
    //加毛玻璃
    //1.创建UIToolBar对象
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    //2.设置toolbar的frame
    toolbar.frame = imageview.bounds;
    //3.设置毛玻璃的样式
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.alpha = 0.85;
    //4.添加到imageview中
    [imageview addSubview:toolbar];
    
    [self.view addSubview:imageview];
    
}

-(void)test {
    UIImageView *imageview = [[UIImageView alloc] init];
    imageview.frame = CGRectMake(100, 100, 250, 200);
    imageview.backgroundColor = [UIColor blueColor];
    
    //设置图片(png图片不需要后缀）
    imageview.image = [UIImage imageNamed:@"192654ba729168c89593b382855510cd"];
    
    // 设置图片内容模式
    /*
     //带有scale表明图片可能被拉伸或压缩
     UIViewContentModeScaleToFill, //完全压缩
     //Aspect比例，缩放是带有比例的
     UIViewContentModeScaleAspectFit,     //宽高比不变 Fit适应 // contents scaled to fit with fixed aspect. remainder is transparent
     UIViewContentModeScaleAspectFill,    //宽高比不变 Fill填充  // contents scaled to fill with fixed aspect. some portion of content may be clipped.
     
     // 重新绘制（核心绘图）
     UIViewContentModeRedraw,              // redraw on bounds change (calls -setNeedsDisplay)
     
     //不带有scale表明图片不可能被拉伸或压缩
     UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     */
    imageview.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imageview];
    
    // 裁剪多余的部分
    imageview.clipsToBounds = YES;
}
@end
