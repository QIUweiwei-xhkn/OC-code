//
//  CalculatorManager.m
//  07-block开发使用场景（当作参数使用）
//
//  Created by wei wei on 2024/8/6.
//

#import "CalculatorManager.h"

@implementation CalculatorManager
- (void)calculate:(NSInteger(^)(NSInteger))calculateBlock {
    if(calculateBlock) {
        _result = calculateBlock(_result);
    }
}
@end
