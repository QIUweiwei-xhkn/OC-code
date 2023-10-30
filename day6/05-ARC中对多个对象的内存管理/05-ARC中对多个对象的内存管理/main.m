//
//  main.m
//  05-ARC中对多个对象的内存管理
//
//  Created by wei wei on 2023/10/22.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
    Dog *d = [[Dog alloc] init];
    p.dog = d;
    d.owner = p;
    d = nil;
    NSLog(@"-------");
    p = nil;
    return 0;
}
