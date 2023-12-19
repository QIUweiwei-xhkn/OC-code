//
//  Car.m
//  07-@class
//
//  Created by wei wei on 2023/10/21.
//

#import "Car.h"
#import "Wheel.h"
@implementation Car
- (void)dealloc
{
    [_wheel release];
    [super dealloc];
}
@end
