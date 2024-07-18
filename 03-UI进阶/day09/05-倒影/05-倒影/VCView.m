//
//  VCView.m
//  05-倒影
//
//  Created by wei wei on 2024/7/12.
//

#import "VCView.h"

@implementation VCView
// 返回当前UIview内容的layer类型
+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

@end
