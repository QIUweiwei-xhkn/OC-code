//
//  ViewController.m
//  03-GCD队列组的使用
//
//  Created by wei wei on 2024/7/19.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** 图片1   */
@property(nonatomic, strong) UIImage *image1;
/** 图片2   */
@property(nonatomic, strong) UIImage *image2;
@end

@implementation ViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test];
}


- (void)group1 {
    // 1.创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 2.创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    // 3.异步函数
    /*
     1）封装任务
     2）把任务添加到队列中
     dispatch_async(queue, ^{
     NSLog(@"1-----%@", [NSThread currentThread]);
     });
     */
    /*
     1）封装任务
     2）把任务添加到队列中
     3）会监听任务的执行情况，通知group
     */
    dispatch_group_async(group, queue, ^{
        NSLog(@"1-----%@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"2-----%@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"3-----%@", [NSThread currentThread]);
    });
    
    // 4. 拦截通知，当队列组中所有的任务都执行完毕的时候回进入到下面的方法
    dispatch_group_notify(group, queue, ^{
        NSLog(@"----------dispatch_group_notify---------------");
    });
}

- (void)group2 {
    // 1.创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 2.创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    // 3.在该方法后面的异步任务会被纳入到队列组的监听范围，进入群组
    // dispatch_group_enter(group); 和  dispatch_group_leave(group); 必须得配对使用
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        NSLog(@"1----%@", [NSThread currentThread]);
        // 离开群组
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        NSLog(@"2----%@", [NSThread currentThread]);
        // 离开群组
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_group_async(group, queue, ^{
        NSLog(@"3----%@", [NSThread currentThread]);
        // 离开群组
        dispatch_group_leave(group);
    });
    
    //拦截通知
    //问题？该方法是阻塞的吗？ 不是，内部本身是异步的
    //    dispatch_group_notify(group, queue, ^{
    //        NSLog(@"-----------------dispatch_group_notify------------------------");
    //    });
    
    //等待， DISPATCH_TIME_FOREVER  死等，直到队列组中所有的任务都执行完毕之后才能执行
    // 阻塞的
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"end");
}

- (void)group3 {
    /*
     1. 下载图片1 开子线程
     2. 下载图片2 开子线程
     3. 合成图片并显示图片、开子线程
     */
    
    // 0.获得全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    // 1.创建队列组
    dispatch_group_t group = dispatch_group_create();
    
    // 2.下载图片1 开子线程
    dispatch_group_async(group, queue, ^{
        // 2.1 获得图片的URL
        NSURL *url = [NSURL URLWithString:@"https://i2.hdslb.com/bfs/archive/afed80819367fbc1b49209f3c5895354b8eb1e00.jpg"];
        // 2.2 下载二进制数据
        NSData *data = [NSData dataWithContentsOfURL:url];
        // 2.3 转换图片
        UIImage *image = [UIImage imageWithData:data];
        self.image1 = image;
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    // 3.下载图片2 开子线程
    dispatch_group_async(group, queue, ^{
        // 2.1 获得图片的URL
        NSURL *url = [NSURL URLWithString:@"https://i0.hdslb.com/bfs/archive/8b28891638a74ae37653a6b1c7ee6d20031e925b.jpg"];
        // 2.2 下载二进制数据
        NSData *data = [NSData dataWithContentsOfURL:url];
        // 2.3 转换图片
        UIImage *image = [UIImage imageWithData:data];
        self.image2 = image;
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    // 4.合成图片并显示图片、开子线程
    dispatch_group_notify(group, queue, ^{
        // 4.1.创建图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        // 4.2 画图1
        [self.image1 drawInRect:CGRectMake(0, 0, 200, 100)];
        self.image1 = nil;
        // 4.3 画图2
        [self.image2 drawInRect:CGRectMake(0, 100, 200, 100)];
        self.image2 = nil;
        // 4.4 根据上下文获得一张图片
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        // 4.5 关闭图形上下文
        UIGraphicsEndImageContext();
        // 4.6 在UI上显示合并图片
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%@", [NSThread currentThread]);
            self.imageView.image = image;
        });
    });
}

- (void)test {
//    dispatch_async(<#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>);
    // 区别：封装任务的方法（block--函数）
    /*
     第一个参数：队列
     第二个参数：参数
     第三个参数：typedef void (*dispatch_function_t)(void *_Nullable);要调用的函数名称
     */
    dispatch_async_f(dispatch_get_global_queue(0, 0), nil, task);
    dispatch_async_f(dispatch_get_global_queue(0, 0), nil, task);
    dispatch_async_f(dispatch_get_global_queue(0, 0), nil, task);
}

void task(void *param) {
    NSLog(@ "%s------%@",__func__, [NSThread currentThread]);
}

@end
