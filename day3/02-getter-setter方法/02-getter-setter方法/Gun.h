//
//  Gun.h
//  01-封装基本概念
//
//  Created by wei wei on 2023/9/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Gun : NSObject
{
    //    @public
    int _bullet;
    // 虽然成员变量不是public之后外界不能直接访问了, 但是还是可以在本类的对象方法中直接访问
}
-(void)shoot;

// 提供一个方法用于设置成员变量的值
-(void)addBulle:(int)count;

// 提供一个方法用于返回成员变量的值
- (int)getBullet;
@end

NS_ASSUME_NONNULL_END
