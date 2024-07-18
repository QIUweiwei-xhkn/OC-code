//
//  QWineCell.h
//  01-数据刷新
//
//  Created by wei wei on 2024/3/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class QWine;
@interface QWineCell : UITableViewCell
/** 模型属性   */
@property(nonatomic, strong) QWine *wine;

@end

NS_ASSUME_NONNULL_END
