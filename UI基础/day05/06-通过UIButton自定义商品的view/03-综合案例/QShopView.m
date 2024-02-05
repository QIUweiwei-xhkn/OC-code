//
//  QShopView.m
//  03-综合案例
//
//  Created by wei wei on 2024/2/5.
//

#import "QShopView.h"
#import "Shop.h"

@implementation QShopView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 文本居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文本颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

#pragma mark - 布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    // 1.获取自身的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    // 设置子控件的frame
    self.imageView.frame = CGRectMake(0, 0, width, width);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}

#pragma mark - 设置子控件的数据
- (void)setShop:(Shop *)shop {
    _shop = shop;
    // 设置子控件数据
    /*
     self.imageView.image = [UIImage imageNamed:shop.icon];
     self.titleLabel.text = shop.name;
     */
    [self setImage:[UIImage imageNamed:shop.icon] forState:UIControlStateNormal];
    [self setTitle:shop.name forState:UIControlStateNormal];
}

@end
