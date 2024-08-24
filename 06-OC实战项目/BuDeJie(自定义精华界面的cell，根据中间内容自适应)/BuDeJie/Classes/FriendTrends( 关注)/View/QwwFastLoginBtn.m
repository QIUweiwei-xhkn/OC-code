//
//  QwwFastLoginBtn.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/14.
//

#import "QwwFastLoginBtn.h"

@implementation QwwFastLoginBtn
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 设置图片位置
    self.imageView.qww_y = 0;
    self.imageView.qww_centerX = self.qww_width * 0.5;
    
    // 设置标题位置
    self.titleLabel.qww_y = self.qww_height - self.titleLabel.qww_height;
    // 计算文字宽度，设置lable宽度
    [self.titleLabel sizeToFit];
    self.titleLabel.qww_centerX = self.qww_width * 0.5;
    
}

@end
