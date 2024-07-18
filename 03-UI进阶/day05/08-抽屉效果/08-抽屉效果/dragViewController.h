//
//  dragViewController.h
//  08-抽屉效果
//
//  Created by wei wei on 2024/7/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface dragViewController : UIViewController
// 放在头文件中，子类才可以获取
// readonly 修饰，只有在自己的.m文件才能使用，防止被子类修改基本样式，不能调用set方法
@property(nonatomic, weak, readonly) UIView * leftV;
@property(nonatomic, weak, readonly) UIView * rightV;
@property(nonatomic, weak, readonly) UIView * mainV;
@end

NS_ASSUME_NONNULL_END
