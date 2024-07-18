//
//  QBuyTitleBtn.m
//  01-彩票
//
//  Created by wei wei on 2024/7/15.
//

#import "QBuyTitleBtn.h"

@implementation QBuyTitleBtn

// 调整子控件位置
// 调节imageView的位置
//- (CGRect)imageRectForContentRect:(CGRect)contentRect

// 调节lable的位置
//- (CGRect)titleRectForContentRect:(CGRect)contentRect


// 调整子控件位置
- (void)layoutSubviews {
    [super layoutSubviews];
    if(self.imageView.x < self.titleLabel.x) {
        self.titleLabel.x = self.imageView.x;
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    [self sizeToFit];
}

- (void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}
@end
