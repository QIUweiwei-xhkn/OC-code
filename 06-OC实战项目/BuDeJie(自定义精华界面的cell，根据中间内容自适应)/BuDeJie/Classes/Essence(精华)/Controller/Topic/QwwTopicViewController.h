//
//  QwwTopicViewController.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/24.
//

#import <UIKit/UIKit.h>
#import "QwwTopicItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface QwwTopicViewController : UITableViewController
/** 帖子的类型   */
@property(nonatomic, assign) QwwTopicType type;
@end

NS_ASSUME_NONNULL_END
