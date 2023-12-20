//
//  main.m
//  14-字符串转换
//
//  Created by wei wei on 2023/11/6.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
//    NSString *str = @"abc";
//    // 1.将字符串转换为大写
//    NSString *newStr1 = [str uppercaseString];
//    NSLog(@"%@", newStr1);
//
//    // 2.将字符串转换为小写
//    NSString *newStr2 = [str lowercaseString];
//    NSLog(@"%@", newStr2);
    
    // 3.将字符串的首字符转换为大写
//    NSString *str = @"htpp://www.520it.com/img/lnj.GIF";
//    NSString *newStr = [str capitalizedString];
//    NSLog(@"%@", newStr);
    
    // 4.字符串与基本数据类型的转换
//    NSString *str1 = @"110";
//    NSString *str2 = @"120";
////    str1 + str2; // 错误
//    int value1 = [str1 intValue];
//    int value2 = [str2 intValue];
//    NSLog(@"sum = %i", value1 + value2);
//    // 注意: 如果不是int,double,float,bool,integer,longlong这些类型就不要乱用
//    NSString *str3 = @"abc";
//    int value3 = [str3 intValue];
//    NSLog(@"value3 = %i", value3);

    // 5.C语言字符串和OC字符串之间的转换
    char *cStr = "Qww";
    NSString *str = [NSString stringWithUTF8String:cStr];
    NSLog(@"str = %@", str);
    
    NSString *newStr = @"QWW";
    const char *cStr2 = [newStr UTF8String];
    NSLog(@"cStr2 = %s", cStr2);
    return 0;
}
