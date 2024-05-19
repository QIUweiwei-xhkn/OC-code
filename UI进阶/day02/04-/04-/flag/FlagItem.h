//
//  FlagItem.h
//  04-
//
//  Created by wei wei on 2024/5/14.
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
