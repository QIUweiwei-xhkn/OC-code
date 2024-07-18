//
//  Phone.m
//  10-super
//
//  Created by wei wei on 2023/9/20.
//

#import "Phone.h"

@implementation Phone
- (void)carameWithFlahlightStatus:(FlahlightStatus)status;
{
    NSLog(@"- carameWithFlahlightStatus");
}
+ (void)carameWithFlahlightStatus:(FlahlightStatus)status
{
    if (status == kFlahlightStatusOpen) {
        [self openFlahlight];
    }else
    {
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
}
@end
