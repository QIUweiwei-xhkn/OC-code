//
//  Qwindow.m
//  03-事件传递
//
//  Created by wei wei on 2024/7/7.
//

#import "Qwindow.h"

@implementation Qwindow
// 作用：去寻找最适合的View
// 什么时候调用：当一个事件传递给当前View，就会调用.
// 返回值：返回的是谁，谁就是最适合的View（就会调用最适合的View的touch方法）
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    UIView *fitView = [super hitTest:point withEvent:event];
//    NSLog(@"%@", fitView);
//    return fitView;
    return self.subviews[0];
}

//作用：判断当前点在不在它调用View，（谁调用pointInside，这个View就是谁）
//什么时候调用：它是在hitTest方法当中调用的.
//注意：point点必须得要跟它方法调用者在同一个坐标系里面
//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@"%s",__func__);
//    return NO;
//}
@end
