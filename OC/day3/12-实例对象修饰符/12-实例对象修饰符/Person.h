//
//  Person.h
//  12-实例对象修饰符
//
//  Created by wei wei on 2023/9/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface Person : NSObject
{
    int _age;
    double _height;
    double _weight;
    NSString *_name;
    NSString *_tel;
    NSString *_email;
}


- (void)setAge:(int)age;
- (void)setHeigth:(double)height;
- (void)setWeight:(double)weight;
- (void)setName:(NSString *)name;
- (void)setTel:(NSString *)tel;
- (void)setEmail:(NSString *)email;

- (int)age;
- (double)height;
- (double)weight;
- (NSString *)name;
- (NSString *)tel;
- (NSString *)email;
@end

NS_ASSUME_NONNULL_END
