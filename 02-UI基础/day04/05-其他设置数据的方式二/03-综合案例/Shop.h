//
//  Shop.h
//  03-综合案例
//
//  Created by wei wei on 2024/1/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Shop : NSObject
/**图片的名称**/
@property(nonatomic,copy) NSString *icon;

/**商品的名称**/
@property(nonatomic,copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
