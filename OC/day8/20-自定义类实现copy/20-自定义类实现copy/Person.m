//
//  Person.m
//  20-自定义类实现copy
//
//  Created by wei wei on 2023/12/2.
//

#import "Person.h"

@implementation Person
- (id)copyWithZone:(nullable NSZone *)zone {
    // 1.创建一个新的对象
    Person *p = [[[self class] allocWithZone:zone] init];
    // 2.设置当前对象的内容给新的对象
    p.age = _age;
    p.name = _name;
    // 3.返回新的对象
    return p;
}
- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    Person *p = [[[self class] allocWithZone:zone] init];
    p.age = _age;
    p.name = _name;
    return p;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name = %@, age = %i", _name, _age];
}
@end
