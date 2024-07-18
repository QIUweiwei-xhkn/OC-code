//
//  blueView.m
//  02-UIView的拖拽
//
//  Created by wei wei on 2024/7/7.
//

#import "blueView.h"

@implementation blueView
// 当开始触摸屏幕时调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}

// 触摸当开始移动时调用(移动时持续调用)
// NSSet: 无序，不可通过下标访问
// NSArarry: 有序
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    UITouch *touch = [touches anyObject];
    // 求偏移量 = 手指当前点的x - 手指上一个点的x
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    NSLog(@"curP ==== %@",NSStringFromCGPoint(curP));
    NSLog(@"preP ==== %@",NSStringFromCGPoint(preP));
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    // 平移
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

// 当手指离开屏幕时调用
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}

// 当发生系统事件时会自动调用该方法（如电话打入，自动关机）
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
}
@end
