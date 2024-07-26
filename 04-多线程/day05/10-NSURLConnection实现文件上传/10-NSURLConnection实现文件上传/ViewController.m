//
//  ViewController.m
//  10-NSURLConnection实现文件上传
//
//  Created by wei wei on 2024/7/25.
//

#import "ViewController.h"
/*
1.设置请求头
Content-Type:multipart/form-data; boundary=----WebKitFormBoundaryjvOUFA04ED44A
 
2.按照固定的格式拼接请求体的数据
 
-----WebKitFormBoundaryjv0UfA04ED44AhWx
Content-Disposition: form-data; name="file"; filename="Snip20160225_341.png"
Content-Type: image/png
 
 
------WebKitFormBoundaryjv0UfA04ED44AhWx
Content-Disposition: form-data; name="username"
 
123456
------WebKitFormBoundaryjv0UfA04ED44AhWx--
 
*/
/*
拼接请求体
 分隔符：----WebKitFormBoundaryjvOUFA04ED44A
 1）文件参数
    --分隔符
    Content-Disposition: form-data; name="file"; filename="Snip20160225_341.png"
    Content-Type: image/png（MIMEType:大类型/小类型）
    空行
    文件参数
 2）非文件参数
    --分隔符
    Content-Disposition: form-data; name="username"
    空行
    123456
 3) 结尾标识
    --分隔符--
*/

#define Kboundary @"----WebKitFormBoundaryjvOUFA04ED44A"
#define KNewLine [@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self upload];
}

- (void)upload {
    // 1.确定请求路径
    NSURL *url = [NSURL URLWithString:@"http://120.25.226.186:32812/upload"];
    
    // 2.创建的可变的请求对象
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    // 3.设置请求方式
    request.HTTPMethod = @"POST";
    
    // 4.设置请求方式
//    Content-Type:multipart/form-data; boundary=----WebKitFormBoundaryjvOUFA04ED44A
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@", Kboundary] forHTTPHeaderField:@"Content-Type"];
    
    // 5.拼接请求体数据
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
    
    // 6.设置请求体
    request.HTTPBody = fileData;
    
    // 7.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if(connectionError) {
            NSLog(@"上传失败");
            return;
        }
        // 8.解析数据
        NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSLog(@"上传成功");
    }];
}
@end
