//
//  QContactViewController-2.h
//  02-通讯录
//
//  Created by wei wei on 2024/5/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class QAccountItem;
@interface QContactViewController_2 : UITableViewController
/** 当前的用户名   */
@property(nonatomic, strong) NSString *AccountName;

@property(nonatomic, strong) QAccountItem *accountItem ;
@end

NS_ASSUME_NONNULL_END
