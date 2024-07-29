//
//  ViewController.m
//  05-NSURLSession的相关代理方法
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate>
/** 文件句柄   */
@property(nonatomic, strong) NSFileHandle *handle;
/** 保存路径   */
@property(nonatomic, strong) NSString *fullPath;

/** 下载大小   */
@property(nonatomic, assign) NSInteger currentSize;
/** 文件总大小   */
@property(nonatomic, assign) NSInteger totalSize;
@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.url
    NSURL *url = [NSURL URLWithString:@"https://news.baidu.com"];
    
    // 2.创建请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    // 3.创建会话对象，设置代理
    /*
     第一个参数：配置信息
     第二个参数：代理
     第三个参数：设置代理的方法在那个线程中调用
     */
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 4.创建task
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    
    // 5.执行task
    [dataTask resume];
}

#pragma mark - NSURLSessionDataDelegate

/// 1.接收到服务器的响应 它会默认取消
/// - Parameters:
///   - session: 会话对象
///   - dataTask: 请求任务
///   - response: 响应头信息
///   - completionHandler: 回调， 自己传给系统
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler {
    NSLog(@"%s",__func__);
    
    // 获得文件的全路径
    NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
    // 创建空的文件
    [[NSFileManager defaultManager] createFileAtPath:fullPath contents:nil attributes:nil];
    // 创建句柄
    self.handle = [NSFileHandle fileHandleForWritingAtPath:fullPath];
    
    self.fullPath = fullPath;
    /*
     NSURLSessionResponseCancel = 0,            取消 默认
     NSURLSessionResponseAllow = 1,             接收
     NSURLSessionResponseBecomeDownload = 2,    变成下载任务
     NSURLSessionResponseBecomeStream           变成流
     */
    completionHandler(NSURLSessionResponseAllow);
    
    // 获得文件的总大小
    self.totalSize = response.expectedContentLength;
    NSLog(@"%zd", self.totalSize);
}


/// 2.接收到服务器返回的数据，调用多次
/// - Parameters:
///   - session: 会话对象
///   - dataTask: 请求任务
///   - data: 本次的下载数据
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
//    NSLog(@"%s",__func__);
    
    // 写入数据到文件
    [self.handle writeData:data];
    
    self.currentSize += data.length;
    // 输出下载进度
    NSLog(@"%f", 1.0 * self.currentSize / self.totalSize);
}


/// 3.请求结束或是失败时调用
/// - Parameters:
///   - session: 会话对象
///   - task: 请求任务
///   - error: 错误信息
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
//    NSLog(@"%s",__func__);
    NSLog(@"%@", self.fullPath);
}
@end
