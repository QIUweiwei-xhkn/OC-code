//
//  Account.m
//  06-多个对象内存管理练习
//
//  Created by wei wei on 2023/10/20.
//

#import "Account.h"

@implementation Account
- (void)dealloc
{
    NSLog(@"%s", __func__);
    [_email release];
    [_pwd release];
    [super dealloc];
}
@end
