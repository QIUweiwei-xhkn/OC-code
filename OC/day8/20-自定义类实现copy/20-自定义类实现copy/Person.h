//
//  Person.h
//  20-自定义类实现copy
//
//  Created by wei wei on 2023/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSCopying, NSMutableCopying>
@property(nonatomic, assign)int age;
@property(nonatomic,copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
