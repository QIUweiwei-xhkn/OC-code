//
//  main.m
//  01-protocol（协议）的基本概念
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "Teacher.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    [p playFootball];
    [p playBasketball];
    [p playBaseball];
    
    Student *s = [[Student alloc] init];
    [s playFootball];
    
    Teacher *t = [[Teacher alloc] init];
    [t playBasketball];
    return 0;
}
