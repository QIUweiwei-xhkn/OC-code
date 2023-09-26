//
//  main.m
//  04-property增强
//
//  Created by wei wei on 2023/9/22.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    [p setAge:-100];
//    NSLog(@"age = %i", [p age]);
//    NSLog(@"age = %i, _age = %i", p->age, p->_age);
    return 0;
}
