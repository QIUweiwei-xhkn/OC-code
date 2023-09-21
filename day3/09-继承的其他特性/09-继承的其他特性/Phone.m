//
//  Phone.m
//  09-继承的其他特性
//
//  Created by wei wei on 2023/9/20.
//

#import "Phone.h"

@implementation Phone
- (void)signalWithNumber:(NSString *)number
{
    NSLog(@"利用手机打电话给%@", number);
}

- (void)sendMessageWithNumber:(NSString *)number andContent:(NSString *)content
{
    NSLog(@"利用手机发短信给%@, 内容是%@", number, content);
}

+ (void)brand
{
    NSLog(@"品牌");
}
@end
