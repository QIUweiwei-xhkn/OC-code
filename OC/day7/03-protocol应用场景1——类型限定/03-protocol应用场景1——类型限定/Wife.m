//
//  Wife.m
//  03-protocol应用场景1——类型限定
//
//  Created by wei wei on 2023/10/29.
//

#import "Wife.h"

@implementation Wife
// 会做饭
- (void)cooking
{
    NSLog(@"%s", __func__);
}
// 会洗衣服
- (void)washing
{
    NSLog(@"%s", __func__);
}
// 有一份好工作
- (void)job
{
    NSLog(@"%s", __func__);
}
@end
