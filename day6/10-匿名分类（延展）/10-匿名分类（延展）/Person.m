//
//  Person.m
//  10-匿名分类（延展）
//
//  Created by wei wei on 2023/10/28.
//

#import "Person.h"

@interface Person ()
{
    int _age;
}
-(void)say;
@end
@implementation Person
//{
//    int _age;
//}
-(void)eat {
    NSLog(@"%s",__func__);
}
-(void)say {
    NSLog(@"%s",__func__);
}
@end
