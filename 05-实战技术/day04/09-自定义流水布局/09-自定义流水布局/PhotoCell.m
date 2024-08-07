//
//  PhotoCell.m
//  09-自定义流水布局
//
//  Created by wei wei on 2024/8/6.
//

#import "PhotoCell.h"
@interface PhotoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setImage:(UIImage *)image {
    _image = image;
    _imageView.image = image;
}
@end
