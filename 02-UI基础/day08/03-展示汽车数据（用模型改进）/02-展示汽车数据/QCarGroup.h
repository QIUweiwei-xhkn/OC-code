//
//  QCarGroup.h
//  02-展示汽车数据
//
//  Created by wei wei on 2024/2/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCarGroup : NSObject
/** 头部标题   */
@property(nonatomic,copy) NSString *header;

/** 尾部标题   */
@property(nonatomic,copy) NSString *footer;

/** 所有车   */
@property(nonatomic, strong) NSArray *cars;
@end

NS_ASSUME_NONNULL_END
