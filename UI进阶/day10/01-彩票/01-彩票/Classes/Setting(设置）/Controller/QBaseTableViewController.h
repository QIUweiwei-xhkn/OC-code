//
//  QBaseTableViewController.h
//  01-彩票
//
//  Created by wei wei on 2024/7/18.
//

#import <UIKit/UIKit.h>
#import "QSettingTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface QBaseTableViewController : UITableViewController
/** 组模型·   */
@property(nonatomic, strong) NSMutableArray *groupArr;
@end

NS_ASSUME_NONNULL_END
