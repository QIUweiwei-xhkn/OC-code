//
//  Iphone.m
//  09-继承的其他特性
//
//  Created by wei wei on 2023/9/20.
//

#import "Iphone.h"

@implementation Iphone
- (void)setCpu:(int)cpu
{
    _cpu = cpu;
}

- (int)cpu
{
    return _cpu;
}


- (void)signalWithNumber:(NSString *)number
{
    NSLog(@"利用 iphone 打电话给 %@", number);
}

+ (void)brand
{
    NSLog(@"iPhone手机");
}
@end
