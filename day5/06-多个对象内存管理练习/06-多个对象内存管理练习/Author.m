//
//  Author.m
//  06-多个对象内存管理练习
//
//  Created by wei wei on 2023/10/20.
//

#import "Author.h"

@implementation Author
- (void)dealloc
{
    NSLog(@"%s", __func__);
    [_name release];
    [_icon release];
    [_account release];
    [super dealloc];
}
@end
