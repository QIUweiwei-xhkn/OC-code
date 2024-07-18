//
//  QShopView.h
//  03-综合案例
//
//  Created by wei wei on 2024/1/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QShopView : UIView
// readonly 只会调用get方法
///** 图片控件   */
//@property(nonatomic, weak, readonly) UIImageView *iconView;
///** 标题控件   */
//@property(nonatomic, weak, readonly) UILabel *titleLable;

// 提供接口方法
- (void)setIcon:(NSString *)icon;
- (void)setName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
