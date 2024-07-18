//
//  QShopView.h
//  03-综合案例
//
//  Created by wei wei on 2024/1/31.
//

#import <UIKit/UIKit.h>
@class Shop;

NS_ASSUME_NONNULL_BEGIN

@interface QShopView : UIView
/** 商品模型   */
@property(nonatomic, strong) Shop *shop;
@end

NS_ASSUME_NONNULL_END
