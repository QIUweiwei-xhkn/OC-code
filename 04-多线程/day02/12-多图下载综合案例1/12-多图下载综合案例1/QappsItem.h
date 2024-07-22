//
//  QappsItem.h
//  12-多图下载综合案例1
//
//  Created by wei wei on 2024/7/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QappsItem : NSObject
/** app的名字   */
@property(nonatomic, strong) NSString *name;
/** app的图片的url地址   */
@property(nonatomic, strong) NSString *icon;
/** app的下载量   */
@property(nonatomic, strong) NSString *download;

+(instancetype)appWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
