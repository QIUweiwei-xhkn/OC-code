//
//  ViewController.m
//  05-NSURLSession的相关代理方法
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate>
/** 接收响应体信息   */
@property(nonatomic, strong) NSMutableData *data;
@end

@implementation ViewController
- (NSMutableData *)data {
    if(_data == nil) {
        _data = [[NSMutableData alloc] init];
    }
    return _data;
}

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
    /*
     NSURLSessionResponseCancel = 0,            取消 默认
     NSURLSessionResponseAllow = 1,             接收
     NSURLSessionResponseBecomeDownload = 2,    变成下载任务
     NSURLSessionResponseBecomeStream           ios9.0以后可以使用 变成下载任务
     */
    completionHandler(NSURLSessionResponseAllow);
}


/// 2.接收到服务器返回的数据，调用多次
/// - Parameters:
///   - session: 会话对象
///   - dataTask: 请求任务
///   - data: 本次的下载数据
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSLog(@"%s",__func__);
    [self.data appendData:data];
}


/// 3.请求结束或是失败时调用
/// - Parameters:
///   - session: 会话对象
///   - task: 请求任务
///   - error: 错误信息
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    NSLog(@"%s",__func__);
    NSLog(@"%@", [[NSString alloc] initWithData:self.data encoding:NSUTF8StringEncoding]);
}
@end
