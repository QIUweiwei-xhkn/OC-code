//
//  Person.m
//  01-私有变量和私有方法
//
//  Created by wei wei on 2023/9/21.
//

#import "Person.h"

@implementation Person
{
@public
    double _score;
}
-(void)test {
    NSLog(@"score = %f",_score);
}
@end
