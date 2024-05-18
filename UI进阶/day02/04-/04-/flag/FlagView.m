//
//  FlagView.m
//  04-
//
//  Created by wei wei on 2024/5/14.
//

#import "FlagView.h"
#import "FlagItem.h"

@interface FlagView ()
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageV;

@end

@implementation FlagView

+ (instancetype)flagView {
    return [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil] lastObject];
}

- (void)setItem:(FlagItem *)item {
    _item = item;
    // 给子控件赋值
    self.nameL.text = item.name;
    self.iconImageV.image = [UIImage imageNamed:item.icon];
}
@end
