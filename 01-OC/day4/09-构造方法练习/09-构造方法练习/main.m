//
//  main.m
//  09-构造方法练习
//
//  Created by wei wei on 2023/9/24.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
//    Person *p = [[Person alloc] init];
//    NSLog(@"%@",p);
//    Person *p1 = [[Person alloc] init];
//    NSLog(@"%@",p1);

    Student *stu = [[Student alloc] init];
    NSLog(@"%@", stu);
    
    Student *stu1 = [[Student alloc] init];
    NSLog(@"%@", stu1);

    return 0;
}
