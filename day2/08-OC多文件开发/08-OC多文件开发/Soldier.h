//
//  Soldier.h
//  08-OC多文件开发
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
NS_ASSUME_NONNULL_BEGIN

@interface Soldier : NSObject
{
@public
    NSString *_name;
    double _height;
    double _weight;
}
// 开火, 给士兵一把枪和一个弹夹
- (void)fire:(Gun *)gun clip:(Clip *)clip;
@end

NS_ASSUME_NONNULL_END
