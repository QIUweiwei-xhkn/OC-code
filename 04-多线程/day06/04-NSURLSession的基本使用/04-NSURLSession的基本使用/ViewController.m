//
//  ViewController.m
//  04-NSURLSession的基本使用
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self post];
}

- (void)get {
    // 1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON"];
    
    // 2.创建请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 4.创建task
    /*
     第一个参数：请求对象
     第二个参数：completionHandler 当请求完之后调用 ！！！在子线程中调用，注意线程之间的通信
        data:响应体信息
        response：响应头信息
        error：错误信息，当请求失败时error有值
     */
    // 不会阻塞主线程
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"%@", [NSThread currentThread]);
        if(error) {
            NSLog(@"下载失败");
            return;
        }
        // 6.解析数据
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    // 5.执行task
    [dataTask resume];
}

- (void)get2 {
    // 1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login?username=520it&pwd=520it&type=JSON"];
    
//    // 2.创建请求
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 4.创建task
    /*
     第一个参数：路径
     第二个参数：completionHandler 当请求完之后调用 ！！！在子线程中调用，注意线程之间的通信
        data:响应体信息
        response：响应头信息
        error：错误信息，当请求失败时error有值
     */
    // 注意：dataTaskwithURL 内部会自动的将请求路径作为参数创建一个请求对象（GET）
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"%@", [NSThread currentThread]);
        if(error) {
            NSLog(@"下载失败");
            return;
        }
        // 6.解析数据
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    // 5.执行task
    [dataTask resume];
}

- (void)post {
    // 1.确定URL
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/login"];
    
    // 2.创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 2.2设置请求方式
    request.HTTPMethod = @"POST";
    // 2.3.设置请求体
    request.HTTPBody = [@"username=520it&pwd=520it&type=JSON" dataUsingEncoding:NSUTF8StringEncoding];
    
    // 3.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    // 4.创建task
    /*
     第一个参数：请求对象
     第二个参数：completionHandler 当请求完之后调用 ！！！在子线程中调用，注意线程之间的通信
        data:响应体信息
        response：响应头信息
        error：错误信息，当请求失败时error有值
     */
    // 不会阻塞主线程
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"%@", [NSThread currentThread]);
        if(error) {
            NSLog(@"下载失败");
            return;
        }
        // 6.解析数据
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    // 5.执行task
    [dataTask resume]; 
}
@end
