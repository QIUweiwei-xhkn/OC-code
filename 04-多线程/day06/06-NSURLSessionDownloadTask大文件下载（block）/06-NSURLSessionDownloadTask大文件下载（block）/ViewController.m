//
//  ViewController.m
//  06-NSURLSessionDownloadTask大文件下载（block）
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self download];
}

// 优点：不需要担心内存
// 缺点：无法监听文件下载进度
- (void)download {
    // 1.url
    NSURL *url = [NSURL URLWithString:@"https://i0.hdslb.com/bfs/archive/725d80b222fc428153232ebbe9164bacf99006ab.jpg"];
    
    // 2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 4.创建Task
    /*
     第一个参数：请求对象
     第二个参数： completionHandler 回调函数
        location:
        response:响应体
        error：错误信息
     */
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 6.处理数据
        NSLog(@"%@---%@", location, [NSThread currentThread]);
        
        // 6.1 拼接文件的全路径
        NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
        // 6.2 剪切文件
        [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:fullPath] error:nil];
        NSLog(@"%@", fullPath);
    }];
    
    // 5.执行task
    [downloadTask resume];
}
@end
