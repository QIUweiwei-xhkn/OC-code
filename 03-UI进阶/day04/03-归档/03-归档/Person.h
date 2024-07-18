//
//  Person.h
//  03-归档
//
//  Created by wei wei on 2024/5/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSSecureCoding>
/** <#注释#>   */
@property(nonatomic, strong) NSString *name;
/** <#注释#>   */
@property(nonatomic, assign) NSInteger age;
@end

NS_ASSUME_NONNULL_END
