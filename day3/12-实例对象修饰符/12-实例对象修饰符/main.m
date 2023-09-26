//
//  main.m
//  12-实例对象修饰符
//
//  Created by wei wei on 2023/9/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    [p test];
    //    p->_age = 30;
    //    p->_height = 1.75;
//        p->_weight = 60.0;
    //    p->_name = @"lnj";
    
    Student *stu = [[Student alloc] init];
    stu->_name = @"Qweiwei";
    [stu test];
    NSLog(@"-----");
    return 0;
}
