//
//  QPopMenu.h
//  01-彩票
//
//  Created by wei wei on 2024/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^MyBlock) (BOOL);

@class QPopMenu;
@protocol QPopMenuDelegate <NSObject>

- (void)popMenuDidCloseBtn:(QPopMenu *)popMenu;

@end

@interface QPopMenu : UIView
+ (instancetype)showInCenter:(CGPoint)center;
//-（void）hideInCenter：（CGPoint） center completion：（參数类型）参数名；
// 没有參数没有返回值block void(^) ()
- (void)hideInCenter: (CGPoint) center completion: (MyBlock)completion;

//- (void)hideInCenter:(CGPoint)center;

/** 代理   */
@property(nonatomic, weak) id<QPopMenuDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
