//
//  QTabBar.m
//  01-彩票
//
//  Created by wei wei on 2024/7/13.
//

#import "QTabBar.h"
#import "QTabBarButton.h"

@interface QTabBar ()
/** 当前选中的按钮   */
@property(nonatomic, weak) UIButton *selectedBtn;
@end
@implementation QTabBar

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        for(int i = 0; i < 0; i++) {
//            
//        }
//    }
//    return self;
//}

//- (void) setCount: (NSInteger) count {
//    _count = count;
//    for (int i=0; i < self.count; i++) {//  添加子控件
//        UIButton *button = [[UIButton alloc] init];
//        [self addSubview:button];
//        //    button setImage: (nullable UIImage *) forState: (UIControlState);
//    }
//}

- (void)setItems:(NSArray *)items {
    _items = items;
    for(int i = 0; i < items.count; i++) {
        // 添加子控件
        QTabBarButton  *button = [[QTabBarButton alloc] init];
        [self addSubview:button];
        UITabBarItem *tabBar = items[i];
        [button setImage:tabBar.image forState:UIControlStateNormal];
        [button setImage:tabBar.selectedImage forState:UIControlStateSelected];
        [button addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchDown];
    }
}

- (void)btnOnClick:(UIButton *) btn {
    // 1.取消选中按钮的状态
    self.selectedBtn.selected = NO;
    // 3.修改点击按钮的状态
    btn.selected = YES;
    // 3.设置当前选中按钮
    self.selectedBtn = btn;
    // 通知外界切换子控件
    if([self.delegate respondsToSelector:@selector(tabBar:WithIndex:)]) {
        [self.delegate tabBar:self WithIndex:btn.tag];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 调整子控件的大小
    CGFloat butttonX = 0;
    CGFloat butttonY = 0;
    CGFloat butttonW = self.frame.size.width / self.subviews.count;
    CGFloat butttonH = self.frame.size.height;
    int i = 0;
    for (UIButton *btn in self.subviews) {
        if(i == 0) {
            self.selectedBtn = btn;
            btn.selected = YES;
        }
        btn.tag = i;
        butttonX = butttonW * i;
        i++;
        btn.frame = CGRectMake(butttonX, butttonY, butttonW, butttonH);
    }
    
}
@end
