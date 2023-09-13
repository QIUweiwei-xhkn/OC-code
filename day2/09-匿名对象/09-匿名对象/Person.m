//
//  Person.m
//  09-匿名对象
//
//  Created by wei wei on 2023/9/13.
//

#import "Person.h"

@implementation Person
-(void)say
{
    NSLog(@"name = %@, age = %i", _name, _age);
}

- (void)signal:(Ipone *)phone
{
    [phone callWithNumber:12345678];
}
@end
