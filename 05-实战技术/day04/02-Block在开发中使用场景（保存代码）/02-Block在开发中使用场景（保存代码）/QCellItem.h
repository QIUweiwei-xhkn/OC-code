//
//  QCellItem.h
//  02-Block在开发中使用场景（保存代码）
//
//  Created by wei wei on 2024/8/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCellItem : UITableViewCell
/** 标题   */
@property(nonatomic, strong)NSString  *title;

/** <#注释#>   */
@property(nonatomic, strong) void(^block)(void);

+(instancetype)cellInitWithTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
