//
//  main.m
//  11-字符串截取
//
//  Created by wei wei on 2023/11/6.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSString *str = @"<head>小码哥</head>";
    
    // NSRange : 位置/长度
//    NSRange range =  {6, 3};
//    NSRange range;
//    range.location = 6;
//    range.length = 3;
    // 只要是OC提供的结构体, 一般都可以使用NSMakeXXX来创建
//    NSRange range = NSMakeRange(6, 3);
    
    /*
     // 1.动态获取截取的起始位置
     NSUInteger location = [str rangeOfString:@">"].location + 1;
     // 2.动态获取截取的长度
     // 注意:rangeOfString是从左至右的开始查找, 只要找到就不找了
     NSUInteger length = [str rangeOfString:@"<" options:(NSBackwardsSearch)].location - location;
 //    NSUInteger length = [str rangeOfString:@"</"].location - location;
     NSLog(@"location = %lu, length = %lu", location, length);
     NSRange range = NSMakeRange(location, length);
     NSString *newStr = [str substringWithRange:range];
     NSLog(@"str = %@", str);
     NSLog(@"newStr = %@", newStr);

 //    NSString *temp = @"abcdefa";
 //    NSRange range =[temp rangeOfString:@"a" options:NSBackwardsSearch];
 //    NSLog(@"%lu", range.location);
     */
    
    // 从什么地方开始截取, 一直截取到最后
//    NSString *newStr1 = [str substringFromIndex:6];
//    NSLog(@"newStr1 = %@", newStr1); // newStr1 = 小码哥</head>
//    //从开头开始截取, 一直截取到什么位置
//    NSString *newStr2 = [str substringToIndex:6];
//    NSLog(@"newStr2 = %@", newStr2); // newStr2 = <head>
    
    /*
     <head>小码哥</head> --> 小码哥</head>  --> 小码哥
     <head>小码哥</head> --> <head>小码哥  --> 小码哥
    */
//    NSLog(@"str = %@", str);
//    NSUInteger location = [str rangeOfString:@">"].location + 1;
//    NSString *newStr = [str substringFromIndex:location];
//    NSLog(@"newStr = %@", newStr);
//    
//    location = [newStr rangeOfString:@"<" options:4].location;
//    // 改变了指针的指向, 并不是修改了原来的字符串
//    newStr = [newStr substringToIndex:location];
//    NSLog(@"newStr = %@", newStr);
    
    NSLog(@"str = %@", str);
    NSUInteger location = [str rangeOfString:@"<" options:NSBackwardsSearch].location;
    
    NSString *newStr = [str substringToIndex:location];
    NSLog(@"newStr = %@", newStr);
    
    location = [newStr rangeOfString:@">" ].location + 1;
    newStr = [newStr substringFromIndex:location];
    NSLog(@"newStr = %@", newStr);
    return 0;
}
