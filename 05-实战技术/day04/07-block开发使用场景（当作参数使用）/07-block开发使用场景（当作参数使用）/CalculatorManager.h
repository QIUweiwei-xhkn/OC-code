//
//  CalculatorManager.h
//  07-block开发使用场景（当作参数使用）
//
//  Created by wei wei on 2024/8/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorManager : NSObject
/** <#注释#>   */
@property(nonatomic, assign) NSInteger result;

- (void)calculate:(NSInteger(^)(NSInteger))calculateBlock;
@end

NS_ASSUME_NONNULL_END
