//
//  main.m
//  15-NSMutableString基本概念
//
//  Created by wei wei on 2023/11/6.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
//    NSString *str = @"Qww"; // 一开始str指向@"lnj"对应的内存
//    str = @"qww"; // 修改了str指针的指向, 让它指向@"lmj"对应的内存
//    NSString *newStr = [str stringByReplacingOccurrencesOfString:@"q" withString:@"P"];
//    NSLog(@"%@", newStr);

    // 创建一个空的字符串
    NSMutableString *str = [NSMutableString string];
    NSLog(@"修改前：%@", str);
    [str appendFormat:@"Qww"];
    NSLog(@"修改后：%@", str);
    
    NSMutableString *strM = [[NSMutableString alloc] init];
//    strM = [NSMutableString alloc] initWithFormat:<#(nonnull NSString *), ...#>
//    strM = [NSMutableString stringWithFormat:<#(nonnull NSString *), ...#>]
    return 0;
}
