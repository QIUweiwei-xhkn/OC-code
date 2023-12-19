//
//  Student.m
//  15-类的启动过程
//
//  Created by wei wei on 2023/9/27.
//

#import "Student.h"

@implementation Student
+ (void)load
{
    NSLog(@"Student类被加载到内存了");
}
+ (void)initialize
{
    NSLog(@"Studnet initialize");
}

@end
