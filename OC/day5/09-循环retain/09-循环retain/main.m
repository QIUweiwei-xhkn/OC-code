//
//  main.m
//  09-循环retain
//
//  Created by wei wei on 2023/10/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    Dog *d = [[Dog alloc] init];
    
    // 如果A对用要拥有B对象, 而B对应又要拥有A对象, 此时会形成循环retain
    // 如何解决这个问题: 不要让A retain B, B retain A
    // 让其中一方不要做retain操作即可
    p.dog = d; // retain
    d.owner = p; // retain // assign
    
    [p release];
    [d release];
    return 0;
}
