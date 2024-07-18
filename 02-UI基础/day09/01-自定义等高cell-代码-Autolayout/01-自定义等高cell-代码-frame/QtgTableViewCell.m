//
//  QtgTableViewCell.m
//  01-自定义等高cell-代码-frame
//
//  Created by wei wei on 2024/3/5.
//

#import "QtgTableViewCell.h"
#import "Qtg.h"

@interface QtgTableViewCell()
/** 图标   */
@property(nonatomic, weak) UIImageView *iconImageView;
/** 标题   */
@property(nonatomic, weak) UILabel *titleLable;
/** 价格   */
@property(nonatomic, weak) UILabel *priceLable;
/** 购买量   */
@property(nonatomic, weak) UILabel *buyCountLable;

@end
@implementation QtgTableViewCell

// 在这个方法中添加所有子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /** 图标   */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        /** 标题   */
        UILabel *titleLable = [[UILabel alloc] init];
        [self.contentView addSubview:titleLable];
        self.titleLable = titleLable;
        
        /** 价格   */
        UILabel *priceLable = [[UILabel alloc] init];
        priceLable.textColor = [UIColor orangeColor];
        priceLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:priceLable];
        self.priceLable = priceLable;
        
        /** 购买量   */
        UILabel *buyCountLable = [[UILabel alloc] init];
        buyCountLable.textAlignment = NSTextAlignmentRight;
        buyCountLable.textColor = [UIColor grayColor];
        buyCountLable.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:buyCountLable];
        self.buyCountLable = buyCountLable;

    }
    return self;
}



// 设置所有子控件的frame
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat space = 10;
    CGFloat contentViewW = self.contentView.frame.size.width;
    CGFloat contentViewH = self.contentView.frame.size.height;
    /** 图标   */
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconW = 80;
    CGFloat iconH = contentViewH - 2 * space;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    /** 标题   */
    CGFloat titleX = iconX + iconW + space;
    CGFloat titleY = iconY;
    CGFloat titleW = contentViewW - titleX - space;
    CGFloat titleH = 20;
    self.titleLable.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    /** 价格   */
    CGFloat priceW = 100;
    CGFloat priceH = 15;
    CGFloat priceX = titleX;
    CGFloat priceY = iconY + iconH - priceH;
    self.priceLable.frame = CGRectMake(priceX, priceY, priceW, priceH);
    
    /** 购买量   */
    CGFloat buyCountW = 150;
    CGFloat buyCountH = 14;
    CGFloat buyCountX = contentViewW - buyCountW - space;
    CGFloat buyCountY = iconY + iconH - buyCountH;
    self.buyCountLable.frame = CGRectMake(buyCountX, buyCountY, buyCountW, buyCountH);
}

/**
 *  设置子控件的数据
 */
- (void)setTg:(Qtg *)tg {
    _tg = tg;
    self.iconImageView.image = [UIImage imageNamed:tg.icon];
    self.titleLable.text = tg.title;
    self.priceLable.text = [NSString stringWithFormat:@"¥%@", tg.price];
    self.buyCountLable.text = [NSString stringWithFormat:@"%@人已购买", tg.buyCount];
}
@end
