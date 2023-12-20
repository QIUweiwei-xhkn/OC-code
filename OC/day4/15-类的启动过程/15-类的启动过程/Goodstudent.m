//
//  Goodstudent.m
//  15-类的启动过程
//
//  Created by wei wei on 2023/9/27.
//

#import "Goodstudent.h"

@implementation Goodstudent
+ (void)load
{
    NSLog(@"Goodstudent类被加载到内存了");
}
+ (void)initialize
{
    NSLog(@"Goodstudent initialize");
}
@end
