//
//  ViewController.m
//  05-NSURLSession的相关代理方法
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"

#define fileName @"12313.jpg"

@interface ViewController ()<NSURLSessionDataDelegate>
@property (weak, nonatomic) IBOutlet UISlider *progressView;
/** 文件句柄   */
@property(nonatomic, strong) NSFileHandle *handle;
/** 保存路径   */
@property(nonatomic, strong) NSString *fullPath;
/** 任务   */
@property(nonatomic, strong) NSURLSessionDataTask *dataTask;
/** <#注释#>   */
@property(nonatomic, strong) NSURLSession *session;

/** 下载大小   */
@property(nonatomic, assign) NSInteger currentSize;
/** 文件总大小   */
@property(nonatomic, assign) NSInteger totalSize;
@end

@implementation ViewController
- (NSURLSession *)session {
    if(_session == nil) {
        // 3.创建会话对象，设置代理
        /*
         第一个参数：配置信息
         第二个参数：代理
         第三个参数：设置代理的方法在那个线程中调用
         */
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

- (NSString *)fullPath {
    if(_fullPath == nil) {
        // 获得文件的全路径
        _fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileName];
    }
    return _fullPath;
}

- (NSInteger)getCurrentSize {
    // 获得指定文件路径对应的文件的数据大小
    NSDictionary *fileDict = [[NSFileManager defaultManager] attributesOfItemAtPath:self.fullPath error:nil];
//    NSLog(@"%@", fileDict);
    return [fileDict[@"NSFileSize"] integerValue];
}

- (NSURLSessionDataTask *)dataTask {
    if(_dataTask == nil) {
        // 1.url
        NSURL *url = [NSURL URLWithString:@"https://i1.hdslb.com/bfs/archive/d75f0fcad46f871afb5548e8b5b3ce6077078fce.jpg"];
        
        // 2.创建请求
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        
        // 2.1 设置请求头信息，告诉服务器请求那一部分
        self.currentSize = [self getCurrentSize];
        
        NSString *range = [NSString stringWithFormat:@"bytes=%zd-", self.currentSize];
        [request setValue:range forHTTPHeaderField:@"Range"];
        
       
        
        // 4.创建task
        _dataTask = [self.session dataTaskWithRequest:request];
    }
    return _dataTask;
}

- (IBAction)startBtnClick:(id)sender {
    // 5.执行task
    [self.dataTask resume];
}

- (IBAction)suspendBtnClick:(id)sender {
    NSLog(@"+++++++++++暂停+++++++++++++");
    [self.dataTask suspend];
}

// 取消是不可取消的
- (IBAction)cancelBtnClick:(id)sender {
    NSLog(@"+++++++++++取消+++++++++++++");
    [self.dataTask cancel];
}

- (IBAction)continuBtnClick:(id)sender {
    NSLog(@"+++++++++++继续下载+++++++++++++");
    [self.dataTask resume];
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
    
    // 获得文件的总大小
    self.totalSize = response.expectedContentLength + self.currentSize;
    NSLog(@"%zd", self.totalSize);
    
    
    if(self.currentSize == 0) {
        // 创建空的文件
        [[NSFileManager defaultManager] createFileAtPath:self.fullPath contents:nil attributes:nil];
    }
    // 创建句柄
    self.handle = [NSFileHandle fileHandleForWritingAtPath:self.fullPath];
    
    [self.handle seekToEndOfFile];
    
    /*
     NSURLSessionResponseCancel = 0,            取消 默认
     NSURLSessionResponseAllow = 1,             接收
     NSURLSessionResponseBecomeDownload = 2,    变成下载任务
     NSURLSessionResponseBecomeStream           变成流
     */
    completionHandler(NSURLSessionResponseAllow);
    
   
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
//     输出下载进度
    NSLog(@"%f", 1.0 * self.currentSize / self.totalSize);
    self.progressView.value = 1.0 * self.currentSize / self.totalSize;
}


/// 3.请求结束或是失败时调用
/// - Parameters:
///   - session: 会话对象
///   - task: 请求任务
///   - error: 错误信息
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
//    NSLog(@"%s",__func__);
    NSLog(@"%@", self.fullPath);
     
    [self.handle closeFile];
    self.handle = nil;
}

- (void)dealloc
{
    // 清理工作
    // finishTasksAndInvalidate
    [self.session invalidateAndCancel];
}
@end
