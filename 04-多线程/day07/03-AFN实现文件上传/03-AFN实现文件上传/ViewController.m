//
//  ViewController.m
//  03-AFN实现文件上传
//
//  Created by wei wei on 2024/7/29.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

#define Kboundary @"----WebKitFormBoundaryjvOUFA04ED44A"
#define KNewLine [@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self upload2];
}

// 不推荐
- (void)upload {
    // 1.获得会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2.1.确定url
        NSURL *url = [NSURL URLWithString:@"https://i1.hdslb.com/bfs/archive/d75f0fcad46f871afb5548e8b5b3ce6077078fce.jpg"];
    // 2.2.创建请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    // 2.3 设置请求方式
    request.HTTPMethod = @"POST";
    // 2.4 设置请求头
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@", Kboundary] forHTTPHeaderField:@"Content-Type"];
        
    // 3.发送请求上传文件
    NSURLSessionUploadTask *upload = [manager uploadTaskWithRequest:request fromData:[self getBody] progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%f", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        if(error) {
//            NSLog(@"上传失败");
//            return;
//        }
        NSLog(@"%@", response);
    }];
    
    // 4.执行task
    [upload resume];
}

- (void)upload2 {
    // 1.获得会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 2.发送post请求上传文件
    /*
     第一个参数：请求路径
     第二个参数：字典（非文件参数）
     第三个参数：constructingBodyWithBlock 处理要上传的文件数据
     第四个参数：progress 进度回调函数
     第五个参数：success 成功回调函数 responseObject响应体信息
     第六个参数：failure 失败回调函数
     */
    [manager POST:@"https://i1.hdslb.com/bfs/archive/d75f0fcad46f871afb5548e8b5b3ce6077078fce.jpg" parameters:nil headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        // 使用formData来拼接数据
        UIImage *image = [UIImage imageNamed:@"2222"];
        NSData *imageData = UIImagePNGRepresentation(image);
        /*
         第一个参数：二进制数据 上传文件的参数
         第二个参数：服务器的规定
         第三个参数：该文件上传到服务器上用什么名称保存
         第四个参数：类型
         */
//        [formData appendPartWithFileData:imageData name:@"file" fileName:@"XxXx.png" mimeType:@"image/png"];
//        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"/Users/weiwei/Desktop/2222.png"] name:@"file" fileName:@"xxxx.png" mimeType:@"image/png" error:nil];
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:@"/Users/weiwei/Desktop/2222.png"] name:@"file" error:nil];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%f", 1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传成功-- %@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败-- %@", error);
    }];
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
    
    UIImage *image = [UIImage imageNamed:@"2222"];
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

@end
