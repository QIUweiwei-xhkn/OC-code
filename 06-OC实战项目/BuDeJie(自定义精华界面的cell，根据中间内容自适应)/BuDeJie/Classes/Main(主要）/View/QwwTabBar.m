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
/** 前一次点击的底部按钮   */
@property(nonatomic, weak) UIControl *previousClicktabBarButton;
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
    for (UIControl *tabBarButtton in self.subviews) {
        if([tabBarButtton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            // 设置 previousClicktabBarButton 默认为第一个底部按钮
            if(i == 0 && self.previousClicktabBarButton == nil) {
                self.previousClicktabBarButton = tabBarButtton;
            }
            [tabBarButtton addTarget:self action:@selector(batButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            if(i == 2) {
                i += 1;
            }
            btnX = i * btnW;
            tabBarButtton.frame = CGRectMake(btnX, 0, btnW, btnH);
            i++;
        }
        
    }
    self.pubBtn.center = CGPointMake(self.qww_width * 0.5, self.qww_height* 0.5);
}

#pragma mark - 事件处理
// 底部导航栏按钮点击事件
- (void)batButtonClick:(UIControl *)tabBarButton {
    if(self.previousClicktabBarButton == tabBarButton) {
        // 连续两次点击了该按钮
        // 前缀 + 主体 + did\will + 动词 + Notification
        // QWWtabBarButtonDidRepeatClickNotification
        // 发出通知，告知外界tabBatButton被重复点击了
        [[NSNotificationCenter defaultCenter] postNotificationName:QWWtabBarButtonDidRepeatClickNotification object:nil];;
        return;
    }
    self.previousClicktabBarButton = tabBarButton;
}
@end
