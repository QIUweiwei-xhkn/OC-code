//
//  main.m
//  11-自定义构造方法
//
//  Created by wei wei on 2023/9/25.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
//    Person *p1 = [[Person alloc] init];
//    Person *p1 = [[Person alloc] initWithAge:20];
//    Person *p1 = [[Person alloc] initWithName:@"weiwei"];
    Person *p1 = [[Person alloc] initWithAge:20 andName:@"weiwei"];
//    p1.age = 10;
    NSLog(@"%@",p1);
    
//    Person *p2 = [[Person alloc] init];
//    Person *p2 = [[Person alloc] initWithAge:30];
//    Person *p2 = [[Person alloc] initWithName:@"Qweiwei"];
    Person *p2 = [[Person alloc] initWithAge:30 andName:@"Qweiwei"];
//    p2.age = 10;
    NSLog(@"%@",p2);
    
    return 0;
}
