//
//  QtgTableViewCell.m
//  04-自定义等高cell-xib
//
//  Created by wei wei on 2024/3/6.
//

#import "QtgTableViewCell.h"
#import "Qtg.h"

@interface QtgTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbale;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *buyCountLable;

@end
@implementation QtgTableViewCell

- (void)setTg:(Qtg *)tg {
    _tg = tg;
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    self.titleLbale.text = tg.title;
    self.priceLable.text = [NSString stringWithFormat:@"¥%@", tg.price];
    self.buyCountLable.text = [NSString stringWithFormat:@"%@人已购", tg.buyCount];
}

@end
