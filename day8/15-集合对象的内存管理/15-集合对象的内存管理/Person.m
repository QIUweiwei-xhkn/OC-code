//
//  Person.m
//  15-集合对象的内存管理
//
//  Created by wei wei on 2023/11/28.
//

#import "Person.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
