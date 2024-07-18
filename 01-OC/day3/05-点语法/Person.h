//
//  Person.h
//  05-点语法
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    //    @public
    int _age;
    NSString *_name;
    double _height;
}

- (void)setAge:(int)age;
- (void)setName:(NSString *)name;
- (void)setHeight:(double)height;

- (int)age;
- (double)height;
- (NSString *)name;
- (void)test;
@end

NS_ASSUME_NONNULL_END
