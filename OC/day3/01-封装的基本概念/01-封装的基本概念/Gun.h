//
//  Gun.h
//  01-封装的基本概念
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Gun : NSObject
{
//    @public
    int _bullet; // 子弹
    // 虽然成员变量不是public之后外界不能直接访问了, 但是还是可以在本类的对象方法中直接访问
}

/**
 *  射击方法
 */
- (void)shoot;


// 提供一个方法用于设置成员变量的值
- (void)addBullet:(int)count;

// 提供一个方法用于返回成员变量的值
- (int)getBullet;
@end

NS_ASSUME_NONNULL_END
