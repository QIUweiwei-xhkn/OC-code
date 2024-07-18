//
//  QShopView.h
//  02-通过xib自定义商品的view
//
//  Created by wei wei on 2024/2/4.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QShopView : UIView
// 提供set方法
- (void)setIcon: (NSString *)icon;
- (void)setName: (NSString *)name;

// 提供快速构造方法
+ (instancetype)shopView;
@end

NS_ASSUME_NONNULL_END
