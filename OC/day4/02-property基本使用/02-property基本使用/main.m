//
//  main.m
//  02-property基本使用
//
//  Created by wei wei on 2023/9/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    [p setAge:10];
    NSLog(@"age = %d",[p age]);
    return 0;
}
