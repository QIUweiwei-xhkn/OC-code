//
//  QAddContactViewController-3.h
//  02-通讯录
//
//  Created by wei wei on 2024/5/19.
//

#import <UIKit/UIKit.h>
//#import "QContactViewController-2.h"
NS_ASSUME_NONNULL_BEGIN

// 1定义协议
@class QAddContactViewController_3,QAccountItem;
@protocol QAddContactViewControllerDelegate <NSObject>
 
// 2.定义协议方法
- (void)addContactVC:(QAddContactViewController_3 *)addContactVC accountItem:(QAccountItem *)accountItem ;

@end

@interface QAddContactViewController_3 : UIViewController
/** <#注释#>   */
//@property(nonatomic, strong) QContactViewController_2 *contactVC;

/** <#注释#>   */
@property(nonatomic, weak) id<QAddContactViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
