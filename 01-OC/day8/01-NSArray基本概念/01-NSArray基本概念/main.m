//
//  main.m
//  01-NSArray基本概念
//
//  Created by wei wei on 2023/11/22.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
////    NSArray *arr = [[NSArray alloc] init];
////    NSArray *arr = [NSArray arrayWithObject:@"Qww"];
//    // 数组中的nil是结束符
//    NSArray *arr = [NSArray arrayWithObjects:@"Q", @"w", nil, @"W", nil];
//    NSLog(@"%@", arr);
    
    
    Person *p = [Person new];
    NSObject *obj = [NSObject new];
//    NSArray *arr = [NSArray arrayWithObjects:p, obj, @"Qww" ,@"ww", nil];
//    NSLog(@"%@", arr);
//    
//    NSLog(@"数组中元素的个数 count = %lu", [arr count]);
//    
//    NSLog(@"数组中最后一个元素 last = %@", [arr lastObject]);
//    NSLog(@"数组中第一个元素 last = %@", [arr firstObject]);
//    NSLog(@"数组中第三个元素 arr【2】 = %@", [arr objectAtIndex:2]);
//    
//    // 数组中是否包含某元素
//    if([arr containsObject:@"zs"])
//        {
//            NSLog(@"arr中包含zs");
//        }else
//        {
//            NSLog(@"arr中不包含zs");
//        }
    
    // 创建数组简写
    NSString *str = @"Qww";
//    NSArray *arr = [NSArray arrayWithObjects:p, obj, @"Qww" ,@"ww", nil];
    NSArray *arr = @[p, obj, @"Qww" ,@"ww"];
    
    // 获取数组元素的简写
    NSLog(@"%@", [arr objectAtIndex:0]);
    NSLog(@"%@", arr[0]);
    return 0;
}
