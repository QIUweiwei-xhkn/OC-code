//
//  Tools.h
//  21-单例ARC和MRC写法
//
//  Created by wei wei on 2023/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tools : NSObject<NSCopying, NSMutableCopying>
// 一般情况下创建一个单例对象都有一个与之对应的类方法
// 一般情况下用于创建单例对象的方法名称都以share开头, 或者以default开头
+(instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END
