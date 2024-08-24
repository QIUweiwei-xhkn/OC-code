//
//  QwwTitleButton.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/16.
//

#import "QwwTitleButton.h"

@implementation QwwTitleButton
// 警告信息：Designated initializer missing a 'super' call to a designated initializer of the super class
// 意思：【特定构造方法】缺少super去调用父类的【特定构造方法】，不然会出现警告


/*
    特定构造方法
    1》后面带有NS_DESIGNATED_INITIALIZER 的方法，就是特定的构造方法
    2〉子类如果重写了父类的【特定构造方法】，那么必须用super调用父类的【特定构造方法】
 */
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    // 只要重写了这个方法，按钮就无法进入higheLighted状态
}
@end
