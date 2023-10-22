//
//  main.m
//  08-@class的第二个应用场景
//
//  Created by wei wei on 2023/10/21.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *p = [Person new];
    Dog *d = [Dog new];
    
    p.dog = d;
    
    [p release];
    [d release];
    return 0;
}
