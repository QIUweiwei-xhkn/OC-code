//
//  ViewController.m
//  06-NSURLSessionDownloadTask大文件下载（block）
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDownloadDelegate>

@end

@implementation ViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self delegate];
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

- (void)delegate {
    // 1.url
    NSURL *url = [NSURL URLWithString:@"https://i0.hdslb.com/bfs/archive/725d80b222fc428153232ebbe9164bacf99006ab.jpg"];
    
    // 2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3.创建会话对象
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 4.创建Task
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request];
    
    // 5.执行task
    [downloadTask resume];
}

#pragma mark - NSURLSessionDownloadDelegate

/// 写数据
/// - Parameters:
///   - session:                    会话对象
///   - downloadTask:               下载任务
///   - bytesWritten:               本次写入的数据大小
///   - totalBytesWritten:          下载的数据的总大小
///   - totalBytesExpectedToWrite:  文件的总大小
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    // 1.获得文件的下载进度
    NSLog(@"%f", 1.0 * totalBytesWritten / totalBytesExpectedToWrite);
}


/// 当恢复到下载的时候调用该方法
/// - Parameters:
///   - session:            会话对象
///   - downloadTask:       下载任务
///   - fileOffset:         从什么地方下载
///   - expectedTotalBytes: 文件的总大小
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
    NSLog(@"%s",__func__);
}


/// 下载任务完成时调用
/// - Parameters:
///   - session:        会话对象
///   - downloadTask:   下载任务
///   - location:       文件的临时存储路径
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"%@", location);
    // 1 拼接文件的全路径
    NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:downloadTask.response.suggestedFilename];
    // 2 剪切文件
    [[NSFileManager defaultManager] moveItemAtURL:location toURL:[NSURL fileURLWithPath:fullPath] error:nil];
    NSLog(@"%@", fullPath);
}
 


/// 请求结束时调用
/// - Parameters:
///   - session:    会话对象
///   - task:       下载任务
///   - error:       错误信息
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"%s",__func__);
}
@end
