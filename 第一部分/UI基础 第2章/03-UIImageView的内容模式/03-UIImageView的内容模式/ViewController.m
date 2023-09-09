//
//  ViewController.m
//  03-UIImageView的内容模式
//
//  Created by wei wei on 2023/9/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加UIImageView
    // initWithImage会根据传入的图片创建imageView，并且initWithImage的尺寸等于图片的尺寸
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image1"]];
//    imageView.frame = CGRectMake(100, 400, 200, 100);
//    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
    //设置显示图片
//    imageView.image = [UIImage imageNamed:@"image1"];
    
    //内容模式（用来控制图片如何显示）
    imageView.contentMode = UIViewContentModeScaleAspectFill;
//    UIViewContentModeScaleToFill, // 默认显示模式
//    UIViewContentModeScaleAspectFit, // 保持图片的宽高进行拉伸 且居中显示
//    UIViewContentModeScaleAspectFill, // 保持图片的宽高进行拉伸直到宽或高于View一样 且居中显示
//    没有scale 图片不会被拉伸 图片会保持原图片大小
//    UIViewContentModeRedraw,
//    UIViewContentModeCenter,
//    UIViewContentModeTop,
//    UIViewContentModeBottom,
//    UIViewContentModeLeft,
//    UIViewContentModeRight,
//    UIViewContentModeTopLeft,
//    UIViewContentModeTopRight,
//    UIViewContentModeBottomLeft,
//    UIViewContentModeBottomRight,
    imageView.clipsToBounds = YES; // 边框会被裁剪掉
    }
    
@end
