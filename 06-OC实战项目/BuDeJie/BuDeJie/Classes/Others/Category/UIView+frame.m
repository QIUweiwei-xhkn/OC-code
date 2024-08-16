//
//  UIView+frame.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/9.
//

#import "UIView+frame.h"

@implementation UIView (frame)
- (void)setQww_width:(CGFloat)qww_width {
    CGRect frame = self.frame;
    frame.size.width = qww_width;
    self.frame = frame;
}
- (CGFloat)qww_width {
    return self.frame.size.width;
}

- (void)setQww_height:(CGFloat)qww_height {
    CGRect frame = self.frame;
    frame.size.height = qww_height;
    self.frame = frame;
}
- (CGFloat)qww_height {
    return self.frame.size.height;
}

- (void)setQww_y:(CGFloat)qww_y {
    CGRect frame = self.frame;
    frame.origin.y = qww_y;
    self.frame = frame;
}
- (CGFloat)qww_y {
    return self.frame.origin.y;
}

- (void)setQww_x:(CGFloat)qww_x {
    CGRect frame = self.frame;
    frame.origin.x = qww_x;
    self.frame = frame;
}
- (CGFloat)qww_x {
    return self.frame.origin.x;
}

- (void)setQww_centerX:(CGFloat)qww_centerX {
    CGPoint center = self.center;
    center.x = qww_centerX;
    self.center = center;
}

- (CGFloat)qww_centerX {
    return self.center.x;
}

- (void)setQww_centerY:(CGFloat)qww_centerY {
    CGPoint center = self.center;
    center.y = qww_centerY;
    self.center = center;
}

- (CGFloat)qww_centerY {
    return self.center.y;
}
@end
