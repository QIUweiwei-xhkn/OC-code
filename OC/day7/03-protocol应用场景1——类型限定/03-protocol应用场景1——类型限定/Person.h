//
//  Person.h
//  03-protocol应用场景1——类型限定
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "Wife.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(nonatomic, strong)Wife<WifeCondition> *wife;
-(void)show;
@end

NS_ASSUME_NONNULL_END
