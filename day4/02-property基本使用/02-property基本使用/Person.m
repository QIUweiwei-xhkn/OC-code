//
//  Person.m
//  02-property基本使用
//
//  Created by wei wei on 2023/9/21.
//

#import "Person.h"

@implementation Person
//- (void)setAge:(int)age
//{
//    _age = age;
//}
- (void)setHeight:(double)height
{
    _height = height;
}

- (void)setWeight:(double)weight
{
    _weight = weight;
}
- (void)setName:(NSString *)name
{
    _name = name;
}


//- (int)age
//{
//    return _age;
//}
- (double)height
{
    return _height;
}
- (double)weight
{
    return _weight;
}
- (NSString *)name
{
    return _name;
}
@end
