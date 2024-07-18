//
//  QWine.h
//  01-购物车案例
//
//  Created by wei wei on 2024/4/1.
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

/** 购买数   */
@property(nonatomic, assign) int count;
@end

NS_ASSUME_NONNULL_END
