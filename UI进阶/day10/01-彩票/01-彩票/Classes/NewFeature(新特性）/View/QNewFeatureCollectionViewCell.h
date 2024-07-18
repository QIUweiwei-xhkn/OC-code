//
//  QNewFeatureCollectionViewCell.h
//  01-彩票
//
//  Created by wei wei on 2024/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QNewFeatureCollectionViewCell : UICollectionViewCell
/** <#注释#>   */
@property(nonatomic, strong) UIImage *image;

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count;
@end

NS_ASSUME_NONNULL_END
