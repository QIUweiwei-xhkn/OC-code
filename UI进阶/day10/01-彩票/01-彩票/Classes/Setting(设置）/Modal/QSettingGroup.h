//
//  QSettingGroup.h
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
// 组模型数组描述每一组

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QSettingGroup : NSObject
/**  头部标题   */
@property(nonatomic,copy) NSString *headerTitle;

/** 尾部标题   */
@property(nonatomic,copy) NSString *footTitle;

/** 行模型数组   */
@property(nonatomic, strong) NSArray *itemsArr;

+ (instancetype)initWithItems:(NSArray *)itemsArr;
@end

NS_ASSUME_NONNULL_END
