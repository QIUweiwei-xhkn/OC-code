//
//  ViewController.m
//  05-NSConnection发送POST请求
//
//  Created by wei wei on 2024/7/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self post];
}

- (void)post {
    // 1.确定路径
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    // 2.创建可变请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // 3.修改请求方法，POST必须大写
    request.HTTPMethod = @"POST";
    // 设置属性，请求超时
    request.timeoutInterval = 10;
    // 设置请求头的User-Agent
    [request setValue:@"ios 15.0" forHTTPHeaderField:@"User-Agent"];
    // 4.设置请求体信息， NSString ----> NSData
    request.HTTPBody = [@"小黄人" dataUsingEncoding:NSUTF8StringEncoding];
    
    // 5.发送申请
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            // 6.解析数据   NSData ----> NSString
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
}
@end
