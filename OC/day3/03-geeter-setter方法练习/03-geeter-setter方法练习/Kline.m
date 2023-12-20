//
//  Kline.m
//  03-geeter-setter方法练习
//
//  Created by wei wei on 2023/9/12.
//

#import "Kline.h"

@implementation Kline
- (instancetype)init{
    return self;
}
-(void)setMax:(int)max {
    _max = max;
    // 每次重新设置最大值, 那么就重新计算平均值
    _average = (_min + _max) / 2;
}
-(void)setMin:(int)min{
    _min = min;
    // 每次重新设置最小值, 那么就重新计算平均值
    _average = (_min + _max) / 2;
}
-(void)setAverage:(int)average{
    _average = average;
}

-(int)max {
    return _max;
}
-(int)min {
    return _min;
}
-(int)average {
    return _average;
}

@end
