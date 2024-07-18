//
//  FlagView.m
//  04-拦截用户输入案例
//
//  Created by wei wei on 2024/5/12.
//

#import "FlagView.h"
#import "FlagItem.h"

@interface FlagView ()
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
@implementation FlagView

+(instancetype)flagView {
    return [[[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil] lastObject];
}

- (void)setItem:(FlagItem *)item {
    self.item = item;
    // 给子控件赋值
    self.nameLable.text = item.name;
    self.iconImageView.image = [UIImage imageNamed:item.icon];
}
@end
