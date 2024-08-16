//
//  UITextField+placehoder.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/14.
//

#import "UITextField+placehoder.h"
#import <objc/message.h>

@implementation UITextField (placehoder)
+ (void)load {
    Method setPlaceholder = class_getInstanceMethod(self, @selector(setPlaceholder:));
    Method qww_setPlaceholder = class_getInstanceMethod(self, @selector(qww_setPlaceholder:));
    method_exchangeImplementations(setPlaceholder, qww_setPlaceholder);
}

- (void)setPlacehoderColor:(UIColor *)placehoderColor {
    // 给成员属性赋值， 用runtime给系统的类添加新的属性
    objc_setAssociatedObject(self, @"placehoderColor", placehoderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 设置占位文字颜色
    UILabel *placehoderLable = [self valueForKey:@"placeholderLabel"];
    placehoderLable.textColor = placehoderColor;
}

- (UIColor *)placehoderColor {
    return objc_getAssociatedObject(self, @"placehoderColor");
}

// 设置占位文字
// 设置占位文字颜色
- (void)qww_setPlaceholder:(NSString *)placeholder {
    [self qww_setPlaceholder:placeholder];
    self.placehoderColor = self.placehoderColor;
}
@end
