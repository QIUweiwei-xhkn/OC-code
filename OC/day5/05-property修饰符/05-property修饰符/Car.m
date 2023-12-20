//
//  Car.m
//  05-property修饰符
//
//  Created by wei wei on 2023/10/13.
//

#import "Car.h"

@implementation Car
- (void)dealloc
{
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
