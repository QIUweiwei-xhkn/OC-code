//
//  ViewController.m
//  11-NSOperation之间的线程通信
//
//  Created by wei wei on 2024/7/20.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** 图片1   */
//@property(nonatomic, strong) UIImage *image1;
//
///** 图片2   */
//@property(nonatomic, strong) UIImage *image2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self comBie];
}

- (void)download {
    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 2.封装操作
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        //  加载图片
        NSURL *url = [NSURL URLWithString:@"https://img2.baidu.com/it/u=3903063730,1798934012&fm=253&fmt=auto&app=120&f=JPEG?w=799&h=500"];
        NSLog(@"download----- %@", [NSThread currentThread]);
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        // 4.更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            NSLog(@"UI----- %@", [NSThread currentThread]);
            self.imageView.image = image;
        }];
    }];
    
    // 3。添加操作
    [queue addOperation:op];
}

- (void)comBie {
    __block UIImage *image1;
    __block UIImage *image2;
    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 2.1封装操作 下载图片一
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        //  加载图片
        NSURL *url = [NSURL URLWithString:@"https://img2.baidu.com/it/u=3903063730,1798934012&fm=253&fmt=auto&app=120&f=JPEG?w=799&h=500"];
        NSLog(@"download----- %@", [NSThread currentThread]);
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        image1 = image;
    }];
    
    // 2.2封装操作 下载图片二
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        //  加载图片
        NSURL *url = [NSURL URLWithString:@"https://img2.baidu.com/it/u=3903063730,1798934012&fm=253&fmt=auto&app=120&f=JPEG?w=799&h=500"];
        NSLog(@"download----- %@", [NSThread currentThread]);
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        image2 = image;
    }];
    
    // 3.合并图片
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        // 3.1 开启图片上下文
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        // 3.2 添加图片1
        [image1 drawInRect:CGRectMake(0, 0, 200, 100)];
        // 3.3 添加图片2
        [image2 drawInRect:CGRectMake(0, 100, 200, 100)];
        // 3.5 从图形上下文中获得图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        // 3.5 关闭图片上下文
        UIGraphicsEndImageContext();
        // 5. 更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = image;
            NSLog(@"UI ----- %@", [NSThread currentThread]);
        }];
    }];
    
    // 4。添加操作约束,添加进队列
    [op3 addDependency:op1];
    [op3 addDependency:op2];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
}
@end
