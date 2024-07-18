//
//  main.m
//  13-自定义类工厂方法
//
//  Created by wei wei on 2023/9/26.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
//    Person *p = [[Person alloc] init];
//    Person *p1 = [Person person];
//    p1.age = 20;
    Person *p1 = [Person personWithAge:20];
    NSLog(@"age = %i",p1.age);
    
    /*
     自定义类工厂方法是苹果的一个规范, 一般情况下, 我们会给一个类提供自定义构造方法和自定义类工厂方法用于创建一个对象
     */
    
//    [[NSString alloc] init];
//    [NSString string];
//
//    [[NSString alloc] initWithString:<#(NSString *)#>];
//    [NSString stringWithString:<#(NSString *)#>];
//
//    [[NSArray alloc] init];
//    [NSArray array];
//    [NSArray alloc] initWithObjects:<#(id), ...#>, nil
//    [NSArray arrayWithObjects:<#(id), ...#>, nil]

    return 0;
}
