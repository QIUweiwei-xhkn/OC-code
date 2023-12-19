//
//  Dog.m
//  19-copy和Property
//
//  Created by wei wei on 2023/11/28.
//

#import "Dog.h"

@implementation Dog
- (void)dealloc
{
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
