//
//  Person.h
//  03-autorelease应用场景
//
//  Created by wei wei on 2023/10/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic, assign)int age;
+(instancetype)person;
-(instancetype)initWithAge:(int)age;
+(instancetype)personWithAge:(int)age;
@end

NS_ASSUME_NONNULL_END
