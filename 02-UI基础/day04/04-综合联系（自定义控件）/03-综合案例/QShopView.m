//
//  QShopView.m
//  03-综合案例
//
//  Created by wei wei on 2024/1/31.
//

#import "QShopView.h"

@interface QShopView ()

@end

@implementation QShopView

// 初始化子控件
-(instancetype) init {
    if(self = [super init]) {
        /*
         // 0.获取当前控件的尺寸
         CGFloat width = self.frame.size.width;
         CGFloat height = self.frame.size.height;
         
         NSLog(@"init: %f------%f", width, height);
         */
        
        
        // 1.创建商品UIImageView对象
        UIImageView *iconView = [[UIImageView alloc] init];
//        iconView.frame = CGRectMake(0, 0, width, width);
        iconView.backgroundColor = [UIColor blueColor];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        // 2.创建商品标题对象
        UILabel *titleLable = [[UILabel alloc] init];
//        titleLable.frame = CGRectMake(0, width, width, height - width);
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.backgroundColor = [UIColor redColor];
        [self addSubview:titleLable];
        self.titleLable = titleLable;
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
    
    NSLog(@"layoutSubviews: %f------%f", width, height);
    
    // 设置子控件的frame
    self.iconView.frame = CGRectMake(0, 0, width, width);
    self.titleLable.frame = CGRectMake(0, width, width, height - width);
}


@end
