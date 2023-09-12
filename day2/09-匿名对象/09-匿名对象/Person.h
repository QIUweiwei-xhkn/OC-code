//
//  Person.h
//  09-匿名对象
//
//  Created by wei wei on 2023/9/12.
//

#import <Foundation/Foundation.h>
#import "Iphone.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    @public
    int _age;
    NSString *_name;
}
-(void)say;
-(void)signal:(Iphone *)phone;
@end

NS_ASSUME_NONNULL_END
