//
//  Status.m
//  06-多个对象内存管理练习
//
//  Created by wei wei on 2023/10/20.
//

#import "Status.h"

@implementation Status
- (void)dealloc
{
    NSLog(@"%s", __func__);
//    [_text release];
//    _text = nil;
//    [_picture release];
//    _picture = nil;
//    [_author release];
//    _author = nil;
//    [_repostStatus release];
//    _repostStatus = nil;
    
    // 下面这句话相当于调用了set方法
    // 先release旧值, 然后再将新值赋值给属性
    self.text = nil;
    self.picture = nil;
    self.author = nil;
    self.repostStatus = nil;
    [super dealloc];
}
@end
