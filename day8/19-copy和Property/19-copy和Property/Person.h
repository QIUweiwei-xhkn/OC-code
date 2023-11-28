//
//  Person.h
//  19-copy和Property
//
//  Created by wei wei on 2023/11/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^myBlock)();

@interface Person : NSObject
//@property(nonatomic, retain)NSString *name;
@property(nonatomic,copy)NSString *name;

// 注意: 如果是block使用copy并不是拷贝, 而是转移
@property (nonatomic, copy) myBlock pBlock;

@end

NS_ASSUME_NONNULL_END
