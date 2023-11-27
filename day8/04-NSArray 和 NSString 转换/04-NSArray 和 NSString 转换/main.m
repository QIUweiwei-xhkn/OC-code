//
//  main.m
//  04-NSArray 和 NSString 转换
//
//  Created by wei wei on 2023/11/26.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSArray *arr = @[@"QWW", @"Qww", @"qww", @"ww"];
    // 需求: 用-将所有的姓名连接起来生成一个字符串
    
    /*
     // 1.定义一个可变字符串保存拼接之后的结果
     NSMutableString *strM = [NSMutableString string];
     // 2.遍历数组, 取出数组中的每一个元素, 将元素添加到可变字符串中
     for (NSString *str in arr) {
         [strM appendString:str];
         // 3.每次添加完毕之后再添加一个-
         [strM appendString:@"-"];
     }
     [strM deleteCharactersInRange:NSMakeRange(strM.length - 1, 1)];
     NSLog(@"str = %@", strM);
     */

    NSString *str = [arr componentsJoinedByString:@"-"];
//    NSLog(@" str = %@", str);
    
    // 通过一个字符串生成一个数组
    // 也叫做字符串切割
    
    NSString *str2 = @"QWW-Qww-qww-ww";
    NSArray *arr2 = [str componentsSeparatedByString:@"-"];
    NSLog(@"arr2 = %@", arr2);
    return 0;
}
