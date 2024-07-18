//
//  ViewController.m
//  06-资源存放问题
//
//  Created by wei wei on 2024/1/28.
//

#import "ViewController.h"

/*
    加载图片的方式：
    1.imageNamed：
    2.imageWithContentsOfFile:
 
    1.加载Assets.xcassets这里的图片
     1> 打包后变成Assets.Car
     2> 拿不到路径
     3> 只能通过imageNamed：来加载图片
     4> 不能通过imageWithContentsOfFile：来加载图片
    
    2.放在项目中的图片
     1> 可以拿到路径
     2> 能通过imageNamed：来加载图片
     3> 也能通过imageWithContentsOfFile：来加载图片
 */

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //图片设置的方式
    // 方式一
//    self.imageView.image = [UIImage imageNamed:@"1"];
    
    // 方式二
    // 路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"2" ofType:@"jpeg"];
    self.imageView.image = [UIImage imageWithContentsOfFile:path];
}


@end
