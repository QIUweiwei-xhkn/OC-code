//
//  QShopView.m
//  03-综合案例
//
//  Created by wei wei on 2024/2/5.
//

#import "QShopView.h"
#import "Shop.h"

@interface QShopView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@end


@implementation QShopView

+(instancetype)shopView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (void)setShop:(Shop *)shop {
    _shop = shop;
    // 设置子控件
    self.iconView.image = [UIImage imageNamed:shop.icon];
    self.titleLable.text = shop.name;
}
@end
