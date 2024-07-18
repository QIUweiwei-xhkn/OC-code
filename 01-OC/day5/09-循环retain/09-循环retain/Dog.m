//
//  Dog.m
//  09-循环retain
//
//  Created by wei wei on 2023/10/21.
//

#import "Dog.h"
#import "Person.h"
@implementation Dog
- (void)dealloc
{
    NSLog(@"%s",__func__);
//    [_owner release];
//    self.owner = nil;
    [super dealloc];
}
@end
