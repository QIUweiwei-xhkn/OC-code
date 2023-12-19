//
//  Iphone.m
//  06-self关键字基本概念
//
//  Created by wei wei on 2023/9/13.
//

#import "Iphone.h"

@implementation Iphone
/*
 类方法中可以直接调用类方法
 类方法中不可以直接调用对象方法
 类方法中不能访问成员变量
*/
/*
 如果self在对象方法中, 那么self就代表调用当前对象方法的那个对象
 如果self在类方法中, 那么self就代表调用当前类方法的那个类
 总结:
 我们只用关注self在哪一个方法中 , 如果在类方法那么就代表当前类, 如果在对象方法那么就代表"当前调用该方法的对象"
 */
+ (void)carameWithFlahlightStatus:(FlahlightStatus)status
{
    if (status == kFlahlightStatusOpen) {
//        [Iphone openFlahlight];
        // 其实在类方法中调用类方法除了可以使用类名调用以外, 还可以使用self来调用
        [self openFlahlight];
    }else
    {
//        [Iphone closeFlahlight];
        // self == Iphone
        [self closeFlahlight];
    }
    NSLog(@"拍照");
    
}

+ (void)openFlahlight
{
    NSLog(@"打开闪光灯");
}

+ (void)closeFlahlight
{
    NSLog(@"关闭闪光灯");
}@end
