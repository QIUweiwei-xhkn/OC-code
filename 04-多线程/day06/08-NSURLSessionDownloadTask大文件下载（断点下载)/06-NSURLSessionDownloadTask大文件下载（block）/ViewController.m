//
//  ViewController.m
//  06-NSURLSessionDownloadTask大文件下载（block）
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDownloadDelegate>
/** 下载任务   */
@property(nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
/** 下载数据   */
@property(nonatomic, strong) NSData *resumeData;
/** 会话对象   */
@property(nonatomic, strong) NSURLSession *session;

@end

@implementation ViewController
- (IBAction)startBtnClick:(id)sender {
    // 1.url
    NSURL *url = [NSURL URLWithString:@"https://i0.hdslb.com/bfs/archive/725d80b222fc428153232ebbe9164bacf99006ab.jpg"];
    
    // 2.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3.创建会话对象
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    self.session = session;
    
    // 4.创建Task
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request];
    
    // 5.执行task
    [downloadTask resume];
    
    self.downloadTask = downloadTask;
}

// 暂停是可以恢复的
- (IBAction)suspendBtnClick:(id)sender {
    NSLog(@"+++++++++++暂停++++++++++++++");
    [self.downloadTask suspend];
}

// cancel是不可以恢复的
// cancelByProducingResumeData可以恢复下载
- (IBAction)cancelBtnClick:(id)sender {
    NSLog(@"+++++++++++取消++++++++++++++");
//    [self.downloadTask cancel];
    // 恢复下载的数据 ！= 文件数据
    [self.downloadTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.resumeData = resumeData;
    }];
}

- (IBAction)goOnBtnClick:(id)sender {
    NSLog(@"+++++++++++继续下载++++++++++++++");
    if(self.resumeData) {
        [self.session downloadTaskWithResumeData:self.resumeData];
    }
    [self.downloadTask resume];
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
