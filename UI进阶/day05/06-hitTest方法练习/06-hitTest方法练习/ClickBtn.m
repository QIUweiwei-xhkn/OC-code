//
//  ClickBtn.m
//  06-hitTest方法练习
//
//  Created by wei wei on 2024/7/8.
//

#import "ClickBtn.h"

@implementation ClickBtn
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if(self.popBtn) {
        // 判断当前点不在popBtn上
        CGPoint popBtnP = [self convertPoint:point toView:self.popBtn];
        if([self pointInside:popBtnP withEvent:event])
            return self.popBtn;
        else
            return [super hitTest:point withEvent:event];
    }else
        return [super hitTest:point withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint curP = [touch locationInView:self];
    CGPoint preP = [touch previousLocationInView:self];
    CGFloat offsetX = curP.x - preP.x;
    CGFloat offsetY = curP.y - preP.y;
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
}

@end
