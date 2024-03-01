//
//  QWine.h
//  05-展示单组数据
//
//  Created by wei wei on 2024/3/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QWine : NSObject
/** 名称   */
@property(nonatomic,copy) NSString *name;

/** 价格   */
@property(nonatomic,copy) NSString *money;

/** 图片   */
@property(nonatomic,copy) NSString *image;

+ (instancetype)wineWithDict: (NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
