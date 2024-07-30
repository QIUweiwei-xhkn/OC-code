//
//  ViewController.m
//  04-AFN序列化相关处理
//
//  Created by wei wei on 2024/7/29.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

@interface ViewController ()<NSXMLParserDelegate>

@end

@implementation ViewController
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self httpData2];
}

- (void)json {
    // 1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
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
    [manager GET:@"https://i1.hdslb.com/bfs/archive/d75f0fcad46f871afb5548e8b5b3ce6077078fce.jpg" parameters:paramDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"登入成功");
        NSLog(@"%@-----%@", [responseObject class], responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"登入失败");
    }];
}

- (void)xml {
    // 1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 注意：如果返回的是xml数据，那么应该修改AFN的解析方案
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    
    NSDictionary *paramDict = @{
        @"type": @"XML"
    };
   
    
    [manager GET:@"https://i1.hdslb.com/bfs/archive/d75f0fcad46f871afb5548e8b5b3ce6077078fce.jpg" parameters:paramDict headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"登入成功");
        NSLog(@"%@-----%@", [responseObject class], responseObject);
        NSXMLParser *parser = (NSXMLParser *)responseObject;
        // 设置代理
        parser.delegate = self;
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"登入失败---%@", error);
    }];
}

- (void)httpData {
    // 1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 注意：如果返回的是xml数据，那么应该修改AFN的解析方案 AFXMLParserResponseSerializer
    // 注意：如果返回的数据既不是xml也不是json那么应该修改解析方案为
//    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"https://i1.hdslb.com/bfs/archive/d75f0fcad46f871afb5548e8b5b3ce6077078fce.jpg" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@ -- %@", [responseObject class], responseObject);
//        UIImage *image = [UIImage imageWithData:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"登入失败---%@", error);
    }];
}

- (void)httpData2 {
    // 1.创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 注意：如果返回的是xml数据，那么应该修改AFN的解析方案 AFXMLParserResponseSerializer
    // 注意：如果返回的数据既不是xml也不是json那么应该修改解析方案为
//    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 告诉AFN能够接受text/html类型的数掘
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    [manager GET:@"https://www.baidu.com" parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@ -- %@", [responseObject class], [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
//        UIImage *image = [UIImage imageWithData:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"登入失败---%@", error);
    }];
}

#pragma mark - NSXMLParserDelegate
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    NSLog(@"%@-- %@", elementName, attributeDict);
}
@end
