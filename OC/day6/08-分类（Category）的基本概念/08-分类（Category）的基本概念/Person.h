//
//  Person.h
//  08-分类（Category）的基本概念
//
//  Created by wei wei on 2023/10/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic, assign)int age;
-(void)say;
@end

NS_ASSUME_NONNULL_END
