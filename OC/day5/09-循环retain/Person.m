//
//  Person.m
//  09-循环retain
//
//  Created by wei wei on 2023/10/21.
//

#import "Person.h"
#import "Dog.h"
@implementation Person
- (void)dealloc
{
    NSLog(@"%s",__func__);
//    [_dog release];
    self.dog = nil;
    [super dealloc];
}
@end
