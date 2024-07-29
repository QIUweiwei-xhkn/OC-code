//
//  ViewController.m
//  01-获得文件的MIMEType
//
//  Created by wei wei on 2024/7/26.
//

#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.发送请求，可以响应头（内部有MIMEType）
    // 2.百度
    // 3.调用C语言的API
    // 4.application/octet-stream 任意的二进制数据类型
//    [self getMimeType];
    
    NSString *mimeType = [self mimeTypeForFileAtPath:@"/Users/weiwei/Desktop/ios-basic/04-多线程/day06/01-获得文件的MIMEType/01-获得文件的MIMEType/AppDelegate.h"];
    NSLog(@"%@", mimeType);
}

-(void)getMimeType {
    // 1.url
    NSURL *url = [NSURL URLWithString:@"/Users/weiwei/Desktop/1.png"];
    // 2.创建请求
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    // 3.发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        // 4.获得文件类型
        NSLog(@"MIMEType -- %@", response.MIMEType);
    }];
}

- (NSString *)mimeTypeForFileAtPath: (NSString *)path {
    if(![[[NSFileManager alloc] init] fileExistsAtPath:path]) {
        return nil;
    }
    CFStringRef UTI = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (__bridge CFStringRef)[path pathExtension], NULL);
    CFStringRef MIMEType = UTTypeCopyPreferredTagWithClass (UTI,kUTTagClassMIMEType);
    CFRelease (UTI);
    if (!MIMEType) {
        return @"application/octet-stream";
    }
    return (__bridge NSString *) (MIMEType);
}
@end
