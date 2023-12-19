//
//  main.m
//  11-分类（category）练习
//
//  Created by wei wei on 2023/10/28.
//

#import <Foundation/Foundation.h>
#import "NSString+Q.h"
#import "Person.h"

//int countWithStr(NSString *str) {
//    int count = 0;
//      for(int i = 0; i <  str.length; i++) {
//          unichar c = [str  characterAtIndex:i];
//          if(c >= '0' && c <= '9') {
//              count++;
//          }
//      }
//    return count;
//}

int main(int argc, const char * argv[]) {
    /*
     已知一个字符串, 要求找出字符串中所有的阿拉伯数字
     @"a123jj46kfd5jlwf7ld";
     
     1.计数器思想, 定义一个变量保存结果
     2.遍历字符串, 取出字符串中所有的字符
     */
    NSString *str = @"a123jj46kfd5jlwf7ld";
//    unichar c = [str characterAtIndex:0];
//    NSLog(@"%c",c);
  /*  int count = 0;
    for(int i = 0; i <  str.length; i++) {
        unichar c = [str  characterAtIndex:i];
        if(c >= '0' && c <= '9') {
            count++;
        }
    } */
//    int count = countWithStr(str);
//    int count = [NSString countWithStr:str];
    int count = [str count];
    NSLog(@"count = %i", count);
    
//    Person *p = [[Person alloc] init];
//    [p test];
    return 0;
}
