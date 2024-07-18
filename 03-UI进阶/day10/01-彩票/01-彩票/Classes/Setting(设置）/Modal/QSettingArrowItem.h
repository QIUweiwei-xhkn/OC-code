//
//  QSettingArrowItem.h
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//  绑定类型， 1.绑定类名字符串， 否  2.绑定类名 采用

#import "QSettingItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface QSettingArrowItem : QSettingItem
/** <#注释#>   */
//@property(nonatomic,copy) NSString *<#name#>;

/** 目标控制器   */
@property(nonatomic, assign) Class desVC;
@end

NS_ASSUME_NONNULL_END
