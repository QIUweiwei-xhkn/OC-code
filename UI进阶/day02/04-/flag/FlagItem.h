//
//  FlagItem.h
//  04-拦截用户输入案例
//
//  Created by wei wei on 2024/5/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlagItem : NSObject
/** 国家名称   */
@property(nonatomic, strong) NSString *name;
/** 国家图片名称   */
@property(nonatomic, strong) NSString *icon;

+ (instancetype)itemWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
