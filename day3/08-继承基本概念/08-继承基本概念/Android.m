//
//  Android.m
//  08-继承基本概念
//
//  Created by wei wei on 2023/9/14.
//

#import "Android.h"

@implementation Android
//- (void)signalWithNumer:(NSString *)number {
//    NSLog(@"用Android手机给%@打电话", number);
//}
//
//- (void)sendMessageWithNumber:(NSString*)number andContent:(NSString *)content {
//    NSLog(@"用Android手机给%@发信息，内容是%@",number,content);
//}
- (void)setCpu:(int)cpu
{
    _cpu = cpu;
}

- (int)cpu
{
    return _cpu;
}
@end
