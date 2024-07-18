//
//  ViewController.m
//  04-UIImageView的frame设置
//
//  Created by wei wei on 2023/12/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置imageview的frame
    // 方式1
    /*
     UIImageView *imageview = [[UIImageView alloc] init];
     imageview.image = [UIImage imageNamed:@"1"];
     //    imageview.frame = CGRectMake(100, 100, 100, 75);
         imageview.frame = (CGRect){{100, 100}, {100, 75}};
     */
    
    //方式2
    /*
     UIImageView *imageview = [[UIImageView alloc] init];
     UIImage *image = [UIImage imageNamed:@"1"];
     imageview.frame = CGRectMake(0, 0, image.size.width, image.size.height);
     //设置图片
     imageview.image = image;
     */
    
    //方式3
    /*
     UIImage *image = [UIImage imageNamed:@"1"];
     UIImageView *imageview = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, image.size.width, image.size.height)];
     imageview.image = image;
     */
    
    //方式4
    //注意： initWithImage默认就有尺寸（图片的尺寸）
    //创建imageview时不能改变位置
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    
    //改变位置
    imageview.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:imageview];
}


@end
