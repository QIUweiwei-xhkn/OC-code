//
//  Person.m
//  08-@class的第二个应用场景
//
//  Created by wei wei on 2023/10/21.
//

#import "Person.h"
#import "Dog.h"
@implementation Person
- (void)dealloc
{
    NSLog(@"%s",__func__);
    [_dog release];
    [super dealloc];
}
@end
