//
//  main.m
//  10-instancetype和id的区别
//
//  Created by wei wei on 2023/9/24.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
//    Person *p = [[Person alloc] init];
//    [p setAge:20];

    // 如果init方法的返回值是instancetype, 那么将返回值赋值给一个其它的对象会报一个警告
    // 如果是在以前, init的返回值是id, 那么将init返回的对象地址赋值给其它对象是不会报错的
//    NSString *str = [[Person alloc] init];
    id p = [[Person alloc] init];
//    instancetype p1 = [[Person alloc] init];
//    NSUInteger length = [str length];
//    NSLog(@"length = %lu", length);

    return 0;
}
