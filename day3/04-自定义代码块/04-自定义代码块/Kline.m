//
//  Kline.m
//  04-自定义代码块
//
//  Created by wei wei on 2023/9/13.
//

#import "Kline.h"

@implementation Kline
- (void)setMin:(int)min
{
    _min = min;
    // 每次重新设置最小值, 那么就重新计算平均值
    _average = (_min + _max) / 2;
}

- (void)setMax:(int)max
{
    _max = max;
    // 每次重新设置最大值, 那么就重新计算平均值
    _average = (_min + _max) / 2;
}

- (void)setAverage:(int)average
{
    _average = average;
}

- (int)min
{
    return _min;
}

- (int)max
{
    return _max;
}

- (int)average
{
    return _average;
}
@end
