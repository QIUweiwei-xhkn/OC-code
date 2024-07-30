//
//  ViewController.m
//  01-AFN基本使用
//
//  Created by wei wei on 2024/7/29.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self post];
}

- (void)get {
    // 1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // http://120.25.226.186:32812/login?username=123&pwd=122&type=JSON
    NSDictionary *paramDict = @{
        @"username": @"123",
        @"pwd": @"123",
        @"type": @"JSON"
    };
    // 2.发送GET
    /*
     第一个参数：请求路径（不包含参数） NSString类型
     第二个参数：字典(发送给服务器的数据/参数
     第三个参数：
     第四个参数：progress 进度回调
     第五个参数：success 成功回调
         task：请求任务
         responseObject：响应体信息（JSON--》OC对象）
     第六个参数：failure 失败回调
        task:请求任务
        error:失败信息
        响应头：task.response
     */
    [manager GET:@"http://120.25.226.186:32812/login" parameters:paramDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"登入成功");
        NSLog(@"%@-----%@", [responseObject class], responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"登入失败");
    }];
}


- (void)post {
    // 1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // http://120.25.226.186:32812/login?username=123&pwd=122&type=JSON
    NSDictionary *paramDict = @{
        @"username": @"123",
        @"pwd": @"123",
        @"type": @"JSON"
    };
    // 2.发送POST
    /*
     第一个参数：请求路径（不包含参数） NSString类型
     第二个参数：字典(发送给服务器的数据/参数
     第三个参数：
     第四个参数：progress 进度回调
     第五个参数：success 成功回调
         task：请求任务
         responseObject：响应体信息（JSON--》OC对象）
     第六个参数：failure 失败回调
     */
    [manager POST:@"http://120.25.226.186:32812/login" parameters:paramDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"登入成功");
        NSLog(@"%@-----%@", [responseObject class], responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"登入失败");
    }];
}
@end
