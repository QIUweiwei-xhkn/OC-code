//
//  QShopView.h
//  03-综合案例
//
//  Created by wei wei on 2024/2/5.
//

#import <UIKit/UIKit.h>
@class Shop;

NS_ASSUME_NONNULL_BEGIN

@interface QShopView : UIButton
/** 模型数据   */
@property(nonatomic, strong) Shop *shop;
@end

NS_ASSUME_NONNULL_END
