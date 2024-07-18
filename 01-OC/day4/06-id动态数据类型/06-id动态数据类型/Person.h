//
//  Person.h
//  06-id动态数据类型
//
//  Created by wei wei on 2023/9/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    @public
    int _age;
}
-(void)sleep;
@property int age;
@end

NS_ASSUME_NONNULL_END
