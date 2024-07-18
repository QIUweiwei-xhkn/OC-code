//
//  HandleImageView.h
//  07-画板
//
//  Created by wei wei on 2024/7/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HandleImageView;
@protocol handleImageViewDelegte <NSObject>
- (void)handleImageView:(HandleImageView *)handleImageView newImage:(UIImage *)newImage;
@end

@interface HandleImageView : UIView
/** <#注释#>   */
@property(nonatomic, strong) UIImage *image;
/** <#注释#>   */
@property(nonatomic, weak) id<handleImageViewDelegte> delegate;
@end

NS_ASSUME_NONNULL_END
