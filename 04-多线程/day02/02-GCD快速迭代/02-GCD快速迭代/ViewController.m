//
//  ViewController.m
//  02-GCD快速迭代
//
//  Created by wei wei on 2024/7/19.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self moveFileWithGCD];
}

- (void)forDemo {
    // 同步
    for(int i = 0; i < 100; i++) {
        NSLog(@"%d-----%@", i, [NSThread currentThread]);
    }
}

//  开子线程和主线程一起完成遍历任务，任务的执行时并发的
- (void) apply {
    /*
     第一个参数：遍历的次数
     第二个參数：队列（并发队列）
     第三个參数：index 索引
     */
    dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t iteration) {
        NSLog(@"%zd-----%@", iteration, [NSThread currentThread]);
    });
}

- (void)moveFile {
    // 1.拿到文件路径
    NSString *from = @"/Users/weiwei/Desktop/ios-basic/04-多线程/day02/02-GCD快速迭代/from";
    // 2.获得目标文件路径
    NSString *to = @"/Users/weiwei/Desktop/ios-basic/04-多线程/day02/02-GCD快速迭代/to";
    // 3.得到目录下面的所有文件
    NSArray *pathArr = [[NSFileManager defaultManager] subpathsAtPath:from];
    NSLog(@"%@", pathArr);
    // 4.遍历所有文件，然后执行剪切操作
    NSInteger count = pathArr.count;
    for(NSInteger i = 0; i < count; i++) {
        NSString *fullPath = [from stringByAppendingPathComponent:pathArr[i]];
        NSString *fullToPath = [to stringByAppendingPathComponent:pathArr[i]];
        /*
         第一个参数：要剪切的文件在哪里
         第二个参数：文件应该被存到哪个位置
         第三个参数：错误提示，可为nil
         */
        [[NSFileManager defaultManager] moveItemAtPath:fullPath toPath:fullToPath error:nil];
        NSLog(@"%@---%@---%@", fullPath, fullToPath, [NSThread currentThread]);
    }
}

- (void)moveFileWithGCD {
    // 1.拿到文件路径
    NSString *from = @"/Users/weiwei/Desktop/ios-basic/04-多线程/day02/02-GCD快速迭代/from";
    // 2.获得目标文件路径
    NSString *to = @"/Users/weiwei/Desktop/ios-basic/04-多线程/day02/02-GCD快速迭代/to";
    // 3.得到目录下面的所有文件
    NSArray *pathArr = [[NSFileManager defaultManager] subpathsAtPath:from];
    NSLog(@"%@", pathArr);
    // 4.遍历所有文件，然后执行剪切操作
    NSInteger count = pathArr.count;
    dispatch_apply(count, dispatch_get_global_queue(0, 0), ^(size_t iteration) {
        NSString *fullPath = [from stringByAppendingPathComponent:pathArr[iteration]];
        NSString *fullToPath = [to stringByAppendingPathComponent:pathArr[iteration]];
        /*
         第一个参数：要剪切的文件在哪里
         第二个参数：文件应该被存到哪个位置
         第三个参数：错误提示，可为nil
         */
        [[NSFileManager defaultManager] moveItemAtPath:fullPath toPath:fullToPath error:nil];
        NSLog(@"%@---%@---%@", fullPath, fullToPath, [NSThread currentThread]);
    });
}
@end

