//
//  Person.m
//  07-MRC转ARC
//
//  Created by wei wei on 2023/10/28.
//

#import "Person.h"
#import "Dog.h"

@implementation Person
- (void)dealloc
{
    NSLog(@"%s",__func__);
}
@end
