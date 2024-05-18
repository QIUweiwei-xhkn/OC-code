//
//  FlagView.h
//  04-
//
//  Created by wei wei on 2024/5/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FlagItem;
@interface FlagView : UIView
+ (instancetype)flagView;
/** <#注释#>   */
@property(nonatomic, strong) FlagItem *item;
@end

NS_ASSUME_NONNULL_END
