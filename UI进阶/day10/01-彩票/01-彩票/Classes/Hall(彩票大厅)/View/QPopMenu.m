//
//  QPopMenu.m
//  01-彩票
//
//  Created by wei wei on 2024/7/15.
//

#import "QPopMenu.h"
#import "QCover.h"

#define QkeyWindow [UIApplication sharedApplication].keyWindow

@implementation QPopMenu
// 当点击X号时调用
- (IBAction)close:(id)sender {
    
    // 缩小到一定大小移除蒙版,通知外界，点击了X按钮，请移除蒙版，设置代理
    if([self.delegate respondsToSelector:@selector(popMenuDidCloseBtn:)]) {
        [self.delegate popMenuDidCloseBtn:self];
    }
}

+ (instancetype)showInCenter:(CGPoint)center {
    UIView *popMenu = [[NSBundle mainBundle] loadNibNamed:@"QPopMenu" owner:nil options:nil][0];
    [QkeyWindow addSubview:popMenu];
    popMenu.center = center;
    // 超出父控件剪切
//    popMenu.layer.masksToBounds = YES;
//    popMenu.clipsToBounds = YES;
    return popMenu;
}

//- (void)hideInCenter:(CGPoint)center {
//    // 点击X号按钮，popMenu菜单边平移，边缩小
//    [UIView animateWithDuration:0.5 animations:^{
//        // 子控件可以超出父控件 添加约束后这样popMenu内的子控件会直尺寸会直接变为零
////        self.frame = CGRectMake(0, 0, 0, 0);
//        
//        self.center = center;
//        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
//    } completion:^(BOOL finished) {
//        // 1.移除自己
//        [self removeFromSuperview];
//        // 2.移除蒙版
////        [QCover hide];
//    }];
//}

- (void)hideInCenter: (CGPoint) center completion: (MyBlock)completion {
    // 点击X号按钮，popMenu菜单边平移，边缩小
    [UIView animateWithDuration:0.5 animations:^{
        // 子控件可以超出父控件 添加约束后这样popMenu内的子控件会直尺寸会直接变为零
        //        self.frame = CGRectMake(0, 0, 0, 0);
        
        self.center = center;
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:completion];
}
@end
