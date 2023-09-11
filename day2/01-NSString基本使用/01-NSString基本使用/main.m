//
//  main.m
//  01-NSString基本使用
//
//  Created by wei wei on 2023/9/11.
//

#import <Foundation/Foundation.h>
@interface Iphone: NSObject {
}
-(NSString *)loadmassage;
@end
@implementation Iphone
//-(char*)loadmassage {
//    return @"我想你";
//}
-(NSString *)loadmassage {
    return @"我想你";
}
@end
int main(int argc, const char * argv[]) {
    // C语言中的字符串
    char *name1 = "nnn";
    char name2[] = "mmm";
    
    // OC中的字符串是一个对象
    // 1.创建一个OC字符串对象 在字符串前家@;
    NSString *str = @"lk";
    
    NSString *str2 = [NSString stringWithFormat:@"age is %i, height is %f", 18, 185.5];
    NSLog(@"str2 = %@", str2); // 2023-09-11 17:23:11.400799+0800 01-NSString基本使用[32108:1131357] str2 = age is 18, height is 185.500000
    Iphone *p = [Iphone new];
//    NSLog(@"content is %s", [p loadmassage]); // 2023-09-11 17:08:02.955088+0800 01-NSString基本使用[31758:1120677] content is \M-XE\M-J\^C\^B
    // 注意：输出C语言字符串用 %s，输出OC字符串用 %@， %@是专门用于输出对象类型的
    NSLog(@"content is %@", [p loadmassage]);  // 2023-09-11 17:15:00.168188+0800 01-NSString基本使用[31914:1125166] content is 我想你
    
    // 2.如何计算字符串的长度
//    char name[] = "njs";
    char name[] = "你";
    size_t size = sizeof(name); // 包含\0
    printf("size = %lu\n",size);  // size = 4
    size_t length = strlen(name); // 不包含\0
    printf("size = %lu\n",length);
    
    NSString *str3 = @"你"; // len = 1
    NSUInteger len = [str3 length]; // 2023-09-11 17:38:08.426503+0800 01-NSString基本使用[32566:1143568] len = 1// 不包含\0 计算的是个数，不是占用字符数
    NSLog(@"len = %lu", len);
    return 0;
}
