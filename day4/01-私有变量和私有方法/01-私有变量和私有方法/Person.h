//
//  Person.h
//  01-私有变量和私有方法
//
//  Created by wei wei on 2023/9/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    @public
    int _age;
    @protected
    double _height;
    @private
    NSString *_name;
    @package
    double  _weight;
}

// 只有方法实现，没有方法声明，这该方法为私有方法
//-(void)test;
// 在OC中没有真正的私有方法
@end

NS_ASSUME_NONNULL_END
