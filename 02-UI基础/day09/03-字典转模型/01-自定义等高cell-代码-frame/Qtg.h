//
//  Qtg.h
//  01-自定义等高cell-代码-frame
//
//  Created by wei wei on 2024/3/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Qtg : NSObject
/** 图标   */
@property(nonatomic,copy) NSString *icon;

/** 标题   */
@property(nonatomic,copy) NSString *title;

/** 价格   */
@property(nonatomic,copy) NSString *price;

/** 购买量   */
@property(nonatomic,copy) NSString *buyCount;

+ (instancetype)tgWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
