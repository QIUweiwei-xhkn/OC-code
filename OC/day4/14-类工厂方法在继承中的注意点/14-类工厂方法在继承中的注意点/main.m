//
//  main.m
//  14-类工厂方法在继承中的注意点
//
//  Created by wei wei on 2023/9/26.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {
//    Student *stu = [Student person];
//    stu.age = 20;
////    NSLog(@"age = %i",stu.age);
//    stu.Id = 123;
//    NSLog(@"Id = %i",stu.Id);
    
    Student *stu = [Student personWithAge:20];
    Person *p = [Person personWithAge:22];
    stu.Id = 888;
    return 0;
}
