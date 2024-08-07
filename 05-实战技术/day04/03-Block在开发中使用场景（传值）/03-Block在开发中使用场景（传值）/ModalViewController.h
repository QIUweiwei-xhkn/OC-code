//
//  ModalViewController.h
//  03-Block在开发中使用场景（传值）
//
//  Created by wei wei on 2024/8/6.
//

#import <UIKit/UIKit.h>

@class ModalViewController;

NS_ASSUME_NONNULL_BEGIN
//@protocol ModalViewControllerDelegate <NSObject>
//@optional
//- (void)modalViewController:(ModalViewController *)modalVC sendValue:(NSString *)value;
//@end

@interface ModalViewController : UIViewController
// 设计方法：想要代理做什么事情

//@property(nonatomic, weak ) id<ModalViewControllerDelegate> delegate;

/** <#注释#>   */
@property(nonatomic, strong) void(^block)(NSString *value);
@end

NS_ASSUME_NONNULL_END
