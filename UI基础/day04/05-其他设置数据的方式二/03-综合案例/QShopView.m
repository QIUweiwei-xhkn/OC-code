//
//  QShopView.m
//  03-综合案例
//
//  Created by wei wei on 2024/1/31.
//

#import "QShopView.h"

@interface QShopView ()
/** 图片控件   */
@property(nonatomic, weak) UIImageView *iconView;
/** 标题控件   */
@property(nonatomic, weak) UILabel *titleLable;
@end

@implementation QShopView

// 初始化子控件
-(instancetype) init {
    if(self = [super init]) {
        
        // 1.创建商品UIImageView对象
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.backgroundColor = [UIColor blueColor];
        [self addSubview:iconView];
        _iconView = iconView;
        
        // 2.创建商品标题对象
        UILabel *titleLable = [[UILabel alloc] init]; 
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.backgroundColor = [UIColor redColor];
        [self addSubview:titleLable];
        _titleLable = titleLable;
    }
    return self;
}

// 布局子控件(可以拿到frame）
- (void)layoutSubviews {
    // 0.一定要调用super
    [super layoutSubviews];
    
    // 1..获取当前控件的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
//    NSLog(@"layoutSubviews: %f------%f", width, height);
    
    // 设置子控件的frame
    self.iconView.frame = CGRectMake(0, 0, width, width);
    self.titleLable.frame = CGRectMake(0, width, width, height - width);
}

- (void)setIcon:(NSString *)icon {
    // 设置数据
    self.iconView.image = [UIImage imageNamed:icon];
}

- (void)setName:(NSString *)name {
    // 设置数据
    self.titleLable.text = name;
}
@end
