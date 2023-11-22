//
//  main.m
//  04-protocol应用场景2-代理设计模式
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "Baby.h"
#import "Nanny.h"
#import "Student.h"
#import "Teacher.h"

int main(int argc, const char * argv[]) {
    // 1.创建婴儿
    Baby *b = [[Baby alloc] init];
    // 2.创建保姆
    Nanny *n = [[Nanny alloc] init];
    // 3.将保姆赋值给婴儿呢
    b.nanny = n;
    
    // 4.换保姆
    Student *stu = [[Student alloc] init];
    b.nanny = stu;
    
    // 5.再次换保姆
    Teacher *t = [[Teacher alloc] init];
    b.nanny = t;
    
    
    //婴儿发飙
    [b food];
    [b sleepy];
    return 0;
}
