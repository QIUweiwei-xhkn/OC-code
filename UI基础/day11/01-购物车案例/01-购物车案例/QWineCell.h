//
//  QWineCell.h
//  01-购物车案例
//
//  Created by wei wei on 2024/4/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class QWine, QWineCell;

@protocol QWineCellDelegate <NSObject>
@optional
-(void)QWineCellDidClickPlusButton:(QWineCell *)cell;
-(void)QWineCellDidClickminusButton:(QWineCell *)cell;
@end

//@class QWine,ViewController;

@interface QWineCell : UITableViewCell
/** 模型   */
@property(nonatomic, strong) QWine *wine;
/** ViewController   */
//@property(nonatomic, weak) ViewController *vc;
/** 代理   */
@property(nonatomic, weak) id <QWineCellDelegate> delegate ;
@end

NS_ASSUME_NONNULL_END
