//
//  Person.h
//  03-多个对象的内存管理
//
//  Created by wei wei on 2023/10/10.
//

#import <Foundation/Foundation.h>
#import "Room.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
{
    Room *_room;
}
-(void)setRoom:(Room *)room;
-(Room *)room;
@end

NS_ASSUME_NONNULL_END
