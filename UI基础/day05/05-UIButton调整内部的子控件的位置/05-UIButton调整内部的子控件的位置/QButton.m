//
//  QButton.m
//  05-UIButton调整内部的子控件的位置
//
//  Created by wei wei on 2024/2/5.
//

#import "QButton.h"

@implementation QButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 改变图片的内容模式
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

/**
 *  重写两个方法
 */
/*
 - (CGRect)titleRectForContentRect:(CGRect)contentRect {
     return CGRectMake(0, 0, 100, 70);
 }

 - (CGRect)imageRectForContentRect:(CGRect)contentRect {
     return CGRectMake(100, 0, 100, 70);
 }
 */

#pragma mark = 方式二
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置子控件位置
    self.titleLabel.frame = CGRectMake(0, 0, 100, 70);
    self.imageView.frame = CGRectMake(100, 0, 100, 70);
    
}
@end
