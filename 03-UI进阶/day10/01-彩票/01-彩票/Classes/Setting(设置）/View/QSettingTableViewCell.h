//
//  QSettingTableViewCell.h
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import <UIKit/UIKit.h>
#import "QSettingItem.h"
#import "QSettingGroup.h"
#import "QSettingArrowItem.h"
#import "QSettingSwitchItem.h"
NS_ASSUME_NONNULL_BEGIN

@class QSettingItem;

@interface QSettingTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (instancetype)cellWithTableView:(UITableView *)tableView cellStyle:(UITableViewCellStyle)cellStyle;
/** 行模型   */
@property(nonatomic, strong) QSettingItem *item;
@end

NS_ASSUME_NONNULL_END
