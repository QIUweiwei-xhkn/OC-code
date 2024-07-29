//
//  ViewController.m
//  11-NSURLSession实现文件上传
//
//  Created by wei wei on 2024/7/29.
//

#define Kboundary @"----WebKitFormBoundaryjvOUFA04ED44A"
#define KNewLine [@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate>

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self upload2];
}

- (void)upload {
    // 1.确定url
    NSURL *url = [NSURL URLWithString:@"https://i1.hdslb.com/bfs/archive/d75f0fcad46f871afb5548e8b5b3ce6077078fce.jpg"];
    
    // 2.创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 2.1 设置请求方式
    request.HTTPMethod = @"POST";
    // 2.2 设置请求头
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@", Kboundary] forHTTPHeaderField:@"Content-Type"];
    
    
    // 3.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 4.创建上传task
    /*
     第一个参数：请求对象
     第二个参数：传递是要上传的数据（请求体）
     第三个参数：
     */
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:[self getBody] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 6.解析数据
        if(error) {
            NSLog(@"上传失败");
            return;
        }
        // 8.解析数据
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"上传成功");
    }];
    
    // 5.执行uploadTask
    [uploadTask resume];
}

// 设置代理，获得下载进度
- (void)upload2 {
    // 1.确定url
    NSURL *url = [NSURL URLWithString:@"https://i1.hdslb.com/bfs/archive/d75f0fcad46f871afb5548e8b5b3ce6077078fce.jpg"];
    
    // 2.创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 2.1 设置请求方式
    request.HTTPMethod = @"POST";
    // 2.2 设置请求头
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@", Kboundary] forHTTPHeaderField:@"Content-Type"];
    
    
    // 3.创建会话对象
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 4.创建上传task
    /*
     第一个参数：请求对象
     第二个参数：传递是要上传的数据（请求体）
     第三个参数：
     */
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:[self getBody] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 6.解析数据
        if(error) {
            NSLog(@"上传失败");
            return;
        }
        // 8.解析数据
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"上传成功");
    }];
    
    // 5.执行uploadTask
    [uploadTask resume];
}


- (NSData *)getBody {
    NSMutableData *fileData = [NSMutableData data];
    // 5.1 设置文件参数
    /*
     --分隔符
     Content-Disposition: form-data; name="file"; filename="Snip20160225_341.png"
     Content-Type: image/png（MIMEType:大类型/小类型）
     空行
     文件参数
     */
    [fileData appendData:[[NSString stringWithFormat:@"--%@",fileData] dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    // name: file 服务器规定的参数
    // filename:Snip20160225_341.png
    [fileData appendData:[@"Content-Disposition: form-data; name=\"file:\"; filename=\"Snip20160225_341.png\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    [fileData appendData:[@"Content-Type: image/png" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    [fileData appendData:KNewLine];
    
    UIImage *image = [UIImage imageNamed:@"1"];
    // UIImage ---> NSData
    NSData *imageData = UIImagePNGRepresentation(image);
    [fileData appendData:imageData];
    [fileData appendData:KNewLine];
    
    // 5.2 非文件参数
    /*
     --分隔符
     Content-Disposition: form-data; name="username"
     空行
     123456
     */
    [fileData appendData:[[NSString stringWithFormat:@"--%@", Kboundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    [fileData appendData:[@"Content-Disposition: form-data; name=\"username\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    [fileData appendData:KNewLine];
    [fileData appendData:[@"123456" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    
    // 5.3 结尾标识
    /*
     --分隔符--
     */
    [fileData appendData:[[NSString stringWithFormat:@"--%@--", Kboundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    return fileData;
}

#pragma mark - NSURLSessionDataDelegate
/// - Parameters:
///   - bytesSent:                  本次发送的数据
///   - totalBytesSent:             上传完成的数据大小
///   - totalBytesExpectedToSend:   文件的总大小
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend {
    NSLog(@"%f", 1.0 * totalBytesSent / totalBytesExpectedToSend);
}

@end
