//
//  Person.m
//  13-自定义类工厂方法
//
//  Created by wei wei on 2023/9/26.
//

#import "Person.h"

@implementation Person
//+(instancetype)person {
//    Person *p1 = [Person alloc];
//    Person *p2 = [p1 init];
//    return p2;
//}

+(instancetype)person {
    return [[Person alloc] init];
}
+(instancetype)personWithAge:(int)age {
    Person *p = [[Person alloc] init];
    p.age = age;
    return p;
}
@end
