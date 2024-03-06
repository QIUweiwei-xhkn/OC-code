//
//  QtgTableViewCell.h
//  04-自定义等高cell-xib
//
//  Created by wei wei on 2024/3/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class Qtg;

@interface QtgTableViewCell : UITableViewCell
/** 团购模型   */
@property(nonatomic, strong) Qtg *tg;
@end

NS_ASSUME_NONNULL_END
