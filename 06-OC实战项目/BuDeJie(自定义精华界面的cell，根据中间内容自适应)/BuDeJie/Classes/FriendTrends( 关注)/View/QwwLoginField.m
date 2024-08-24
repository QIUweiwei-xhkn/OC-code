//
//  QwwLoginField.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/14.
//

#import "QwwLoginField.h"
#import "UITextField+placehoder.h"

@implementation QwwLoginField
/*
     1.设置输入框光标的颜色为白色
     2.正在输入是占位文字为白色
 */


- (void)awakeFromNib {
    [super awakeFromNib];
    // 设置输入框光标的颜色为白色
    self.tintColor = [UIColor whiteColor];
    
    // 监听文本框编辑： 1.代理 2.通知 3.target
    // 原则：不要自己成为自己的代理
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    
    // 不在编辑时，颜色恢复灰色
    [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];
    
    // 设为灰色
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attrs];
    
    // 快速设置占位文字颜色 => 文本框占位文字可能是label => 验证占位文字员label => 拿到label => 查看label属性名（1.runtime 2.断点）
    self.placehoderColor = [UIColor grayColor];
    
    
}

// 文本开始编辑时调用
- (void)textBegin {
    // 设置占位文字为白色
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attrs];
    
//    UILabel *placehoderLable = [self valueForKey:@"placeholderLabel"];
//    placehoderLable.textColor = [UIColor whiteColor];
    
    self.placehoderColor = [UIColor whiteColor];
}

// 文本结束编辑时调用
- (void)textEnd {
    // 设置占位文字为灰色
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attrs];
    
//    UILabel *placehoderLable = [self valueForKey:@"placeholderLabel"];
//    placehoderLable.textColor = [UIColor redColor];
    
    self.placehoderColor = [UIColor grayColor];
}
@end
