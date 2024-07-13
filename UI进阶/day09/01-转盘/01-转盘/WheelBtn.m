//
//  WheelBtn.m
//  01-转盘
//
//  Created by wei wei on 2024/7/12.
//

#import "WheelBtn.h"

@implementation WheelBtn
// 取消系统的高亮状态
- (void)setHighlighted:(BOOL)highlighted {
    
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 0.5);
    if(CGRectContainsPoint(rect, point)) {
        // 在指定区域内
        return [super hitTest:point withEvent:event];
    }else {
        return nil;
    }
}

//返回当前按钮当中图片的位置尺寸
//contentRect：当前按钮的位置尺寸
-(CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat w = 40;
    CGFloat h = 48;
    CGFloat x = (contentRect.size.width - w) * 0.5;
    CGFloat y = 20;
    return CGRectMake(x, y, w, h);
}
@end
