//
//  ViewController.m
//  04-imageView的fram
//
//  Created by wei wei on 2023/9/6.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:@"image1"];
//    imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
//    imageView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:imageView];
    
    
    // 2.
//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.image = [UIImage imageNamed:@"image1"];
////    imageView.frame.size = imageView.image.size; // 报错
////    oc语法规定：不能直接修改oc对象结构体属性的成员
//    CGRect tempframe = imageView.frame;
//    tempframe.size = imageView.image.size;
////    tempframe.size.width = imageView.image.size.width;
////    tempframe.size.height = imageView.image.size.height;
//    imageView.frame = tempframe;
//    imageView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:imageView];
    
    // 3.
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"image1"];
    imageView.frame = (CGRect){{0,0},{imageView.image.size.width,imageView.image.size.height}};
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
    
}


@end
