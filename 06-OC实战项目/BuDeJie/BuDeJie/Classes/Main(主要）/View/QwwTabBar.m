//
//  QwwTabBar.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/9.
//

#import "QwwTabBar.h"
#import "UIView+frame.h"

@interface QwwTabBar ()
/** 发布按钮   */
@property(nonatomic, weak) UIButton *pubBtn;
@end

@implementation QwwTabBar
- (UIButton *)pubBtn {
    if(!_pubBtn) {
        UIButton *pubBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
        [pubBtn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [pubBtn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        
        // 根据按钮尺寸自适应
        [pubBtn sizeToFit];
        _pubBtn = pubBtn;
        
        [self addSubview:_pubBtn];
    }
    return _pubBtn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 布局自定义的tabBar
//    NSLog(@"%@", self.subviews);
    NSInteger count = self.items.count + 1;
    CGFloat btnW = self.qww_width/ count;
    CGFloat btnH = self.qww_height;
    CGFloat btnX = 0;
    NSInteger i = 0;
    for (UIView *view in self.subviews) {
        if([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if(i == 2) {
                i += 1;
            }
            btnX = i * btnW;
            view.frame = CGRectMake(btnX, 0, btnW, btnH);
            i++;
        }
    }
    self.pubBtn.center = CGPointMake(self.qww_width * 0.5, self.qww_height* 0.5);
}

@end
