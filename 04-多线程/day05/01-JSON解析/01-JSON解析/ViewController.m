//
//  ViewController.m
//  01-JSON解析
//
//  Created by wei wei on 2024/7/24.
//

/*
 1.概念
     客户端
     服务器
     请求响应
 2.http通信过程
     1）请求（请求头|请求体（GET没有））
     2）响应（响应头|响应体）
 3.I0S中请求的方式
     NSURLConnection
     NSURLSession
     CFNetwork
     AFN
 4. GET |POST
     区别：參数处理方式（GET参数直接跟在URL后面，POST放在请求体中）
 5. NSURLConnection
     同步：sendsync
     异步：
         1) sendAsync
         2）设置代理
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test];
}

- (void)JsonToOC {
    // 1.确定路径
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    // 2.创建请求对象
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.发送异步请求
    [NSURLConnection sendAsynchronousRequest:request queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 4.解析数据
//        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
        // JSON ---> OC对象 反序列化
        /*
         第一个参数：JSON的二进制
         第二个参数：
             NSJSONReadingMutableContainers = (1UL << 0),   可变数组和字典
             NSJSONReadingMutableLeaves = (1UL << 1),       内部的所有字符串都是可变的 ios7之后有问题，一般不用
             NSJSONReadingFragmentsAllowed = (1UL << 2),    当data 不是数组也不是字典时必须使用该枚举值
         第三个参数：错误信息
         */
        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
//        NSLog(@"%@", dict);
        
        // 当不是数组也不是字典时必须使用该枚举值
        NSString *str = @"\"wendingding\"";
        NSData *strData = [str dataUsingEncoding:NSUTF8StringEncoding];
        id obj = [NSJSONSerialization JSONObjectWithData:strData options:NSJSONReadingFragmentsAllowed error:nil];
        NSLog(@"%@-----%@", [obj class], obj);
    }];
}

/*
 JOSN       OC
 {}         @{}
 []         @[]
 ""         @""
 false      NSNumber 0
 true       NSNumber 1
 null       NSNull为空
 
 */
- (void)JsonWithOC {
//    NSString *str = @"{\"error\":\"用户名不存在\"}";
//    NSString *str = @"[\"error\",\"用户名不存在\"]";
//    NSString *str = @"\"wendingding\"";
//    NSString *str = @"false";
//    NSString *str = @"true";
    NSString *str = @"null";
    id obj = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingFragmentsAllowed error:nil];
    NSLog(@"%@-----%@", [obj class], obj);
    
    //nil
    [NSNull null];  //该方法获得的是一个单粒，表示为空，可以用在字典或者是数组中
}

- (void)OCToJSON {
    NSDictionary *dictM = @{
        @"name": @"dasheng11",
        @"age": @20
    };
    
    NSArray *arrM = @[@"234", @"850"];
    
    //注意：并不是所有的OC对象都能转换为JSON
    NSString *strM = @"WENIDNGDING";
/* Returns YES if the given object can be converted to JSON data, NO otherwise. The object must have the following properties:
    - 最外层一定是  NSArray or NSDictionary
    - 所有元素必须是  NSString, NSNumber, NSArray, NSDictionary, or NSNull
    - 所有字典的key都必须是 NSStrings
    - NSNumbers are not NaN or infinity（不能是无穷大）
 Other rules may apply. Calling this method or attempting a conversion are the definitive ways to tell if a given object can be converted to JSON data.
 */
    BOOL isvaild = [NSJSONSerialization isValidJSONObject:strM];
    if(!isvaild) {
        NSLog(@"%d", isvaild);
        return;
    }
    /*
     第一个参数：要转换的OC对象
     第二个参数：一个选线 NSJSONWritingPrettyPrinted 系统自动排版，美观
     第三个参数：错误信息
     */
    NSData *data = [NSJSONSerialization dataWithJSONObject:strM options:NSJSONWritingPrettyPrinted error:nil];
    
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

- (void)test {
    NSArray *arrM = [NSArray arrayWithContentsOfFile:@"/Users/weiwei/Desktop/apps.plist"];
//    NSLog(@"%@", arrM);
    
//    [arrM writeToFile:@"/Users/weiwei/Desktop/123.json" atomically:YES];  XML形式
    
    // OC-->JSON
    NSData *data = [NSJSONSerialization dataWithJSONObject:arrM options:NSJSONWritingPrettyPrinted error:nil];
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    [data writeToFile:@"/Users/weiwei/Desktop/123.json" atomically:YES];
}
@end
