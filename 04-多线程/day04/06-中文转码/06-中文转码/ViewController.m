//
//  ViewController.m
//  06-中文转码
//
//  Created by wei wei on 2024/7/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self GET];
}

- (void)GET {
    // 1.确定路径
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/s?wd=小黄人&rsv_spt=1&rsv_iqid=0xba2627fc00002840&issp=1&f=8&rsv_bp=1&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_dl=tb&rsv_enter=1&rsv_sug3=20&rsv_sug1=12&rsv_sug7=100&rsv_sug2=0&rsv_btype=i&prefixsug=%25E5%25B0%258F%25E9%25BB%2584%25E4%25BA%25BA&rsp=2&inputT=7386&rsv_sug4=8149"];
    
//    NSString *urlStr = @"https://www.baidu.com/s?wd=小黄人&rsv_spt=1&rsv_iqid=0xba2627fc00002840&issp=1&f=8&rsv_bp=1&rsv_idx=2&ie=utf-8&tn=baiduhome_pg&rsv_dl=tb&rsv_enter=1&rsv_sug3=20&rsv_sug1=12&rsv_sug7=100&rsv_sug2=0&rsv_btype=i&prefixsug=%25E5%25B0%258F%25E9%25BB%2584%25E4%25BA%25BA&rsp=2&inputT=7386&rsv_sug4=8149";
//    NSLog(@"%@", urlStr);
//    // 中文转码处理
//    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSLog(@"%@", urlStr);
//    
//    NSURL *url = [NSURL URLWithString:urlStr];
//    NSLog(@"%@", url);
//    
    // 2.创建请求对象
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 容错处理
        if(connectionError) {
            NSLog(@"发送失败");
            return;
        }
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    }];
}


@end
