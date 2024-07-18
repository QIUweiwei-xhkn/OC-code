//
//  Person.m
//  05-ARC中对多个对象的内存管理
//
//  Created by wei wei on 2023/10/22.
//

#import "Person.h"
#import "Dog.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"%s",__func__);
}
@end
