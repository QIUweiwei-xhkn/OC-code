//
//  Kline.h
//  04-自定义代码块
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Kline : NSObject
{
    int _min;// 最小值
    int _max; // 最大值
    int _average;// 平均值
}
/*
 setter方法
 1. 一定是对象方法
 2. 一定没有返回值
 3. 方法名称一定以set开头, 后面跟上成员变量的名称并且去掉下划线, 然后首字母大写
 4.一定有参数, 参数类型一定和成员变量一样, 参数名称就是成员变量的名称去掉下划线
 */
// <#name井>
- (void)setMax:(int)max;
// 注意: <#随便写井>
- (void)setMin:(int)min;
/*
 getter方法
 1. 一定是对象方法
 2. 一定有返回值, 返回值类型和成员变量的类型一致
 3. 方法名称就是成员变量的名称去掉下划线
 4. 一定没有参数
 */
- (int)min;
- (int)max;
- (int)average;
@end

NS_ASSUME_NONNULL_END
