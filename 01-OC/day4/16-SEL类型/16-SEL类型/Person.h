//
//  Person.h
//  16-SEL类型
//
//  Created by wei wei on 2023/9/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property int age;

+ (void)test;
- (void)demo;

-(void)signalWithNumber:(NSString *)number;
-(void)sendmesageWihtNumber:(NSString *)number andContent:(NSString *)content;
// 调用传入对象的指定方法
- (void)makeObject:(id)obj andSel:(SEL)sel;
@end
NS_ASSUME_NONNULL_END
