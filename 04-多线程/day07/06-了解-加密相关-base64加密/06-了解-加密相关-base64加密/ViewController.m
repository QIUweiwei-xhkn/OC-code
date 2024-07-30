//
//  ViewController.m
//  06-了解-加密相关-base64加密
//
//  Created by wei wei on 2024/7/30.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", [self base64EncodeString:@"A"]);
    NSLog(@"%@", [self base64DecodeString:@"QQ=="]);
}

// 对一个字符串进行base64编码，并返回
- (NSString *)base64EncodeString:(NSString *)str {
    // 1. 将字符串先转成二进制数据
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // 2.对二进制数据进行base64编码，完成之后返回字符串
    return [data base64EncodedStringWithOptions:kNilOptions];
}

- (NSString *)base64DecodeString:(NSString *)str {
    //注意：该字符串str是base64编码后的字符串
    //1.转换为二进制数据（完成了解码的过程）
    NSData *data = [[NSData alloc] initWithBase64EncodedString:str options:kNilOptions];
    //2.把二进制数据在转换为字符串
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
