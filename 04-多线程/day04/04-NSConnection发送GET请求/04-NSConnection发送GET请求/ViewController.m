//
//  ViewController.m
//  04-NSConnection发送GET请求
//
//  Created by wei wei on 2024/7/23.
//

#import "ViewController.h"

@interface ViewController () <NSURLConnectionDataDelegate>

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self delegate];
}

// 同步
/*
 请求：请求头（NSURLRequest默认包含）＋请求体（GET没有）
 响应：响应头（真实类型- -->NSHTTPURLResponse）+响应体(要解析的数据)
 */
-(void)sync {
    /*
     GET:http://120.25.226.186:32812/login?username=123&pwd=456&type=JSON
     协议+主机地址+接口名称+7+參数1&參数26參数3
     post:http://120,25.226.186:32812/login
     协议+主机地址+接口名
     */
    
    // Get：没有请求体
    // 1.确定请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=123&pwd=456&type=JSON"];
    
    // 2.创建请求对象
    // 请求头不需要设置，默认请求头
    // 默认请求方法---->GET 
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    // 3.发送请求
    // 真实类型：NSHTTPURLResponse
    NSHTTPURLResponse *response = nil;
    /*
     第一个参数：请求对象
     第二个参数：响应头信息
     第三个参数：错误信息
     返回值；响应体
     */
    // 阻塞
    NSData *data =  [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    
    // 4.解析 data ----》 字符串
    // NSUTF8StringEncoding
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    NSLog(@"%zd", response.statusCode);
}

// 异步
- (void)async {
    // Get：没有请求体
    // 1.确定请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=123&pwd=456&type=JSON"];
    
    // 2.创建请求对象
    // 请求头不需要设置，默认请求头
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    // 3.发送请求
    // 真实类型：NSHTTPURLResponse
    NSHTTPURLResponse *response = nil;
    /*
     第一个参数：请求对象
     第二个参数：队列，决定代码块的调用线程
     第三个参数：completionHandler 当请求完成（成功｜失败）时回调
     response:响应头
     data:响应体
     connectionError:错误信息
     返回值；响应体
     */
    // 阻塞
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 4.解析 data ----》 字符串
        // NSUTF8StringEncoding
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSHTTPURLResponse *response1 = (NSHTTPURLResponse *)response;
        NSLog(@"%zd", response1 .statusCode);
    }];
    
}

// 代理
- (void)delegate {
    // 1.确定路径
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    
    // 2.创建请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    // 3.设置代理,发送请求
    // 3.1 类方法
//    [NSURLConnection connectionWithRequest:request delegate:self];
    
    // 3.2 对象方法
//    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    // 3.3 设置代理，并不会主动发送请求(startImmediately == YES 时会发送)
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    
    // 调用开始方法，发送请求
    [connection start];
    
//    [connection cancel];    // 取消
}

#pragma mark - NSURLConnectionDataDelegate
// 1.接收到服务器的响应时调用
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"%s",__func__);
}

// 2.接收到服务器返回的数据时调用，当数据量较大时，可能会调用多次
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"%s",__func__);
}

// 3.当请求失败时调用
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%s",__func__);
}

// 4.当请求结束时调用
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%s",__func__);
}
@end
