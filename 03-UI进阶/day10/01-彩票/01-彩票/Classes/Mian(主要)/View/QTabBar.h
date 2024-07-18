//
//  QTabBar.h
//  01-彩票
//
//  Created by wei wei on 2024/7/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class QTabBar;
@protocol QtabBarDelegate <NSObject>

- (void)tabBar:(QTabBar *)tabBar WithIndex:(NSInteger)index;

@end

@interface QTabBar : UIView

///** 子控制器的个数   */
//@property(nonatomic, assign) NSInteger count;

/** 模型数组   */
@property(nonatomic, strong) NSArray *items;

/** <#注释#>   */
@property(nonatomic, strong) id<QtabBarDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
