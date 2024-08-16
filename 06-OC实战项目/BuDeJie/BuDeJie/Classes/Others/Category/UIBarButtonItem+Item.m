//
//  UIBarButtonItem+Item.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/10.
//

#import "UIBarButtonItem+Item.h"

@implementation UIBarButtonItem (Item)
+(UIBarButtonItem *)itemWithImage:(UIImage *)image WithHighlightedImage:(UIImage *)highlightImage addTarget:(id)target action:(SEL)action {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:image forState:UIControlStateNormal];
    [leftBtn setImage:highlightImage forState:UIControlStateHighlighted];
    [leftBtn sizeToFit];
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

+(UIBarButtonItem *)itemWithImage:(UIImage *)image WithSelectedImage:(UIImage *)selectedImage addTarget:(id)target action:(SEL)action {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:image forState:UIControlStateNormal];
    [leftBtn setImage:selectedImage forState:UIControlStateSelected];
    [leftBtn sizeToFit];
    [leftBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}

+(UIBarButtonItem *)backItemWithImage:(UIImage *)image WithSelectedImage:(UIImage *)highlightImage target:(id)target action:(SEL)action title:(NSString *)title{
    UIButton *returnBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [returnBtn setTitle:title forState:UIControlStateNormal];
    [returnBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [returnBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [returnBtn setImage:image forState:UIControlStateNormal];
    [returnBtn setImage:highlightImage forState:UIControlStateHighlighted];
    [returnBtn sizeToFit];
    //设置button的内边距，使其向左边移
    UIButtonConfiguration *btnConfiguration = [UIButtonConfiguration plainButtonConfiguration];
    btnConfiguration.contentInsets = NSDirectionalEdgeInsetsMake(0, -20, 0, 0);
    // 设置按钮标题大小
    btnConfiguration.titleTextAttributesTransformer = ^NSDictionary<NSAttributedStringKey,id> * _Nonnull(NSDictionary<NSAttributedStringKey,id> * _Nonnull textAttributes) {
        NSMutableDictionary *attrs = [textAttributes mutableCopy];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
        return [attrs copy];
    };
    returnBtn.configuration = btnConfiguration;
    [returnBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:returnBtn];
}

@end
