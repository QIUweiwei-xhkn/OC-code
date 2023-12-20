//
//  main.m
//  12-字符串替换
//
//  Created by wei wei on 2023/11/6.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 需求: 将&符号替换为/
//    NSString *str = @"http:&&www.520it.com&img&lnj.gif";
//    
//    // OccurrencesOfString: 要替换谁
//    // withString: 用谁替换
//    NSString *newStr = [str stringByReplacingOccurrencesOfString:@"&" withString:@"/"];
//    NSLog(@"newStr = %@", newStr);
    
    
//    NSString *str = @"    http:&&www.    520it.com  &img&lnj.  gif";
//    // 1.去除空格  2.将&替换为/
//    // 1.去除空格
//    NSString *newStr = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSLog(@"newStr1 = |%@|", newStr);
//    // 2.将&替换为/
//    newStr = [newStr stringByReplacingOccurrencesOfString:@"&" withString:@"/"];
//    NSLog(@"newStr2 = |%@|", newStr);
    
    // 3.替换首尾
//    NSString *str = @"   http:&&www.520it.com&img&lnj.gif   ";
    NSString *str = @"HTTP://www.520it.com/img/LNJ.GIF";
//    NSCharacterSet *characterset = [NSCharacterSet whitespaceCharacterSet];
//    NSString *newStr = [str stringByTrimmingCharactersInSet:characterset];
    NSCharacterSet *characterset = [NSCharacterSet uppercaseLetterCharacterSet];
    NSString *newStr = [str stringByTrimmingCharactersInSet:characterset];
    NSLog(@"newStr = |%@|", newStr);
    return 0;
}
