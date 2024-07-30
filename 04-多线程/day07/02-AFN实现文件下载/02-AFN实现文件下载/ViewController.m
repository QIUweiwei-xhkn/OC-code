//
//  ViewController.m
//  02-AFN实现文件下载
//
//  Created by wei wei on 2024/7/29.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self download];
}

- (void)download {
    // 1.创建会话管理
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURL *url = [NSURL URLWithString:@"https://i1.hdslb.com/bfs/archive/330067496b3963fe0bd2e5152302a6c8a60751e7.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 2.下载文件
    /*
     返回NSURLSessionDownloadTask 对象， 需要执行
     第一个参数：请求对象
     第二个参数：progress 进度回调
     第三个参数：destination 回调（返回目标地址)
         targetPath:临时文件路径
     第四个参数：下载完成之后回调
         response：响应体
         filePath：最终的文件路径
         error：错误信息
     */
    NSURLSessionDownloadTask *download = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%f", 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSLog(@"%@", targetPath);
        NSString *fullpath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"123.png"];
        NSLog(@"%@", [NSURL URLWithString:fullpath]);
        return [NSURL URLWithString:fullpath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"%@", filePath);
    }];
    
    // 3.执行downloadTask
    [download resume];
}
@end
