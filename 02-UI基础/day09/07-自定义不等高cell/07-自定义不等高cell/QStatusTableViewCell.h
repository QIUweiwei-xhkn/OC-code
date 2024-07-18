//
//  QStatusTableViewCell.h
//  07-自定义不等高cell
//
//  Created by wei wei on 2024/3/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class QStatus;
@interface QStatusTableViewCell : UITableViewCell
/** 微博模型   */
@property(nonatomic, strong) QStatus *status;
@end

NS_ASSUME_NONNULL_END
