//
//  QwwTopicCell.h
//  BuDeJie
//
//  Created by wei wei on 2024/8/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class QwwTopicItem;
@interface QwwTopicCell : UITableViewCell
/** 模型数据   */
@property(nonatomic, strong) QwwTopicItem *topic;
@end

NS_ASSUME_NONNULL_END
