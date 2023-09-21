//
//  main.m
//  03-synthesize基本使用
//
//  Created by wei wei on 2023/9/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    [p setAge:88];
    //    NSLog(@"age = %i , p->_age = %i", [p age], p->_age);
    //    NSLog(@"_age = %i, _number = %i", p->_age, p->_number);
    NSLog(@"_age = %i, age = %i", p->_age, p->age); 
    return 0;
}
