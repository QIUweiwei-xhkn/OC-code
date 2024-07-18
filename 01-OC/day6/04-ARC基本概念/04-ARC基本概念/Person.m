//
//  Person.m
//  04-ARC基本概念
//
//  Created by wei wei on 2023/10/22.
//

#import "Person.h"

@implementation Person
-(void)dealloc {
    NSLog(@"%s",__func__);
//    [super dealloc];
}
@end
