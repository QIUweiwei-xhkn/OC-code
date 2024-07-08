//
//  yellowView.m
//  03-事件传递
//
//  Created by wei wei on 2024/7/7.
//

#import "yellowView.h"

@implementation yellowView
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    UIView *fitView = [super hitTest:point withEvent:event];
    return fitView;
}

@end
