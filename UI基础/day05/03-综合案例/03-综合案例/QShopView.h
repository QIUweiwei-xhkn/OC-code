//
//  QShopView.h
//  03-综合案例
//
//  Created by wei wei on 2024/2/5.
//

#import <UIKit/UIKit.h>
#import "Shop.h"

NS_ASSUME_NONNULL_BEGIN

@class Shop;
@interface QShopView : UIView
/** 数据模型   */
@property(nonatomic, strong) Shop *shop;

// 快速构造方法
+ (instancetype)shopView;
@end

NS_ASSUME_NONNULL_END
