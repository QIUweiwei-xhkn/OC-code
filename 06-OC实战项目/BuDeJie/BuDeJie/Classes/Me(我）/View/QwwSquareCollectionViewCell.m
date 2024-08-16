//
//  QwwSquareCollectionViewCell.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/14.
//

#import "QwwSquareCollectionViewCell.h"
#import "QwwSquareItem.h"
#import "UIImageView+WebCache.h"

@interface QwwSquareCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@end

@implementation QwwSquareCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItem:(QwwSquareItem *)item {
    _item = item;
    _nameLable.text = item.name;
    [_iconView sd_setImageWithURL:[NSURL URLWithString:item.icon ]];
}
@end
