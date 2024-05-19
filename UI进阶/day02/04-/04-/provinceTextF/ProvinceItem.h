//
//  ProvinceItem.h
//  04-
//
//  Created by wei wei on 2024/5/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProvinceItem : NSObject
/** 当前省份下的城市   */
@property(nonatomic, strong) NSArray *cities;
/** 当前省份的名称   */
@property(nonatomic, strong) NSString *name;
// 快速把字典转成模型
+(instancetype)itemWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
