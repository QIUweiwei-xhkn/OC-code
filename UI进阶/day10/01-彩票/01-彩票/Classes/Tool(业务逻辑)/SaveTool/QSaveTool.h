//
//  QSaveTool.h
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QSaveTool : NSObject
+ (NSString *)objectForKey:(NSString *)key;
+ (void)setObject:(nullable id)value forKey:(NSString *)defaultName;
@end

NS_ASSUME_NONNULL_END
