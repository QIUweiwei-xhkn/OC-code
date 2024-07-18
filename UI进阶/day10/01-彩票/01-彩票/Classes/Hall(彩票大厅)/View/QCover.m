//
//  QCover.m
//  01-彩票
//
//  Created by wei wei on 2024/7/15.
//

#import "QCover.h"
#define QkeyWindow [UIApplication sharedApplication].keyWindow
@implementation QCover
+ (void)show {
    // 1.创建蒙版
    QCover *cover = [[self alloc] init];
    // 2.添加蒙版
    // 将蒙版添加到窗口上（才同时能覆盖UInavigationCon 和 UItabBarCon）
    [QkeyWindow addSubview:cover];
    // 3.设置蒙版尺寸
    cover.frame = [UIScreen mainScreen].bounds;
//    cover.backgroundColor = [UIColor blackColor];
    // 这样设置背景颜色透明，子控件不会透明
    cover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
//    cover.alpha = 0.7;
    // 父控件透明，子控件也会透明
    // 4.添加popMenu
//    UIView *popMenu = [[UIView alloc] init];
//    [cover addSubview:popMenu];
//    popMenu.frame = CGRectMake(0, 0, 100, 100);
//    popMenu.backgroundColor = [UIColor yellowColor];
}

+ (void)hide {
    // 隐藏蒙版
    for(UIView *view in QkeyWindow.subviews) {
        if([view isKindOfClass:[QCover class]]) {
            // 当前类
            [view removeFromSuperview];
            break; 
        }
    }
}
@end
