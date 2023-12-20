//
//  Person.m
//  01-autorelease基本概念
//
//  Created by wei wei on 2023/10/22.
//

#import "Person.h"

@implementation Person
-(void)run {
    NSLog(@"%s",__func__);
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
