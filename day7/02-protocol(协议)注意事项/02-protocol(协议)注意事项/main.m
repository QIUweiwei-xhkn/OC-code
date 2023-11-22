//
//  main.m
//  02-protocol(协议)注意事项
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    [p playBasketball];
    [p study];
    
    Student *stu = [Student new];
    [stu playBasketball];
    return 0;
}
