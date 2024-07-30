//
//  ViewController.m
//  07-HTTPS演练
//
//  Created by wei wei on 2024/7/30.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface ViewController () <NSURLSessionDelegate>

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self afn];
}

- (void)afn {
    AFHTTPSessionManager *manger = [AFHTTPSessionManager manager];
    
    // 更改解析方式
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 设置对证书的处理方式
    manger.securityPolicy.allowInvalidCertificates = YES;
    manger.securityPolicy.validatesDomainName = NO;
    
    [manger GET:@"https://www.baidu.com" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success -- %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure -- %@", error);
    }];
    
    
}

- (void)session {
    // 1.确定url
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    // 2.创建请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.创建会话对象
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    // 4.创建task
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 6.解析数据
        NSLog(@"%@--- %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding], error);
    }];
    // 5.执行task
    [task resume];
}

#pragma mark - NSURLSessionDelegate
//如果发送的请求是https的，那么才会调用该方法
// challenge 质询，挑战
// NSURLAuthenticationMethodServerTrust 服务器信任
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler {
    if([challenge.protectionSpace.authenticationMethod isEqualToString:@"NSURLAuthenticationMethodServerTrust"]) {
        NSLog(@"%@", challenge.protectionSpace);
        //    NSURLSessionAuthChallengeDisposition 如何处理证书
        /*
         NSURLSessionAuthChallengeUseCredential = 0,    使用该证书 安转该证书
         NSURLSessionAuthChallengePerformDefaultHandling = 1    默认采用方式，忽略证书
         NSURLSessionAuthChallengeCancelAuthenticationChallenge = 2,取消申请 证书忽略
         NSURLSessionAuthChallengeRejectProtectionSpace = 3,    拒绝
         */
        // NSURLCredential 授权信息
        NSURLCredential *credential = [[NSURLCredential alloc] initWithTrust:challenge.protectionSpace.serverTrust];
        completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
    }
}
@end
