//
//  Person.m
//  05-点语法
//
//  Created by wei wei on 2023/9/13.
//

#import "Person.h"

@implementation Person
- (void)setAge:(int)age
{
    _age = age;
}

- (void)setHeight:(double)height
{
    _height = height;
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (int)age
{
    return _age;
}

- (double)height
{
    return _height;
}

- (NSString *)name
{
    return _name;
}
-(void)test {
    NSLog(@"test");
}
@end
