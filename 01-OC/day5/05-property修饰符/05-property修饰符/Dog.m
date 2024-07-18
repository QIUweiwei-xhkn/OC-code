//
//  Dog.m
//  05-property修饰符
//
//  Created by wei wei on 2023/10/13.
//

#import "Dog.h"

@implementation Dog
- (void)dealloc
{
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
