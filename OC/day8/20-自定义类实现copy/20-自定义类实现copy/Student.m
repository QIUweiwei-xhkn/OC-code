//
//  Student.m
//  20-自定义类实现copy
//
//  Created by wei wei on 2023/12/2.
//

#import "Student.h"

@implementation Student
- (id)copyWithZone:(nullable NSZone *)zone {
    // 1.创建副本
    id obj = [[self class] allocWithZone:zone];
    // 2.设置数据给副本
    [obj setAge:[self age]];
    [obj setName:[self name]];
    [obj setHeight:_height];
    // 3.返回副本
    return obj;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"name = %@, age = %i, height = %f", [self name], [self age], _height];
}
@end
