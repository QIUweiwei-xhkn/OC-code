//
//  CalculatorManager.m
//  08-block开发使用场景（当作返回值）
//
//  Created by wei wei on 2024/8/6.
//

#import "CalculatorManager.h"

@implementation CalculatorManager
//- (void)add:(NSInteger)value {
//    _reslute += value;
//}

//- (CalculatorManager *)add:(NSInteger)value {
//    _reslute += value;
//    return self;
//}

- (CalculatorManager * (^)(NSInteger))add{
    return ^ CalculatorManager *(NSInteger value) {
        self->_reslute +=value;
        NSLog(@"调用blcok");
        return self;
    };
}
@end
