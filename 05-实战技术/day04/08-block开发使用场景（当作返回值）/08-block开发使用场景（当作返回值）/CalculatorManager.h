//
//  CalculatorManager.h
//  08-block开发使用场景（当作返回值）
//
//  Created by wei wei on 2024/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorManager : NSObject
/** <#注释#>   */
@property(nonatomic, assign) NSInteger reslute;

//- (void)add:(NSInteger)value;

//- (CalculatorManager *)add:(NSInteger)value;

- (CalculatorManager *(^)(NSInteger))add;
@end

NS_ASSUME_NONNULL_END
