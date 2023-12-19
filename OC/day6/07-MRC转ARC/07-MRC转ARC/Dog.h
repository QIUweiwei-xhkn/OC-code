//
//  Dog.h
//  07-MRC转ARC
//
//  Created by wei wei on 2023/10/28.
//

#import <Foundation/Foundation.h>
@class Bone;

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject
@property(nonatomic, strong)Bone *bone;
@end

NS_ASSUME_NONNULL_END
