//
//  QtgTableViewCell.m
//  01-自定义等高cell-代码-frame
//
//  Created by wei wei on 2024/3/5.
//

#import "QtgTableViewCell.h"
#import "Qtg.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

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
        CGFloat space = 10;
        /** 图标   */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        [iconImageView makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView).offset(space);
            make.bottom.equalTo(self.contentView).offset(-space);
            make.width.equalTo(80);
        }];
        
        /** 标题   */
        UILabel *titleLable = [[UILabel alloc] init];
        [self.contentView addSubview:titleLable];
        self.titleLable = titleLable;
        [titleLable makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(iconImageView.top);
            make.left.equalTo(iconImageView.right).offset(space);
            make.right.equalTo(self.contentView).offset(-space);
            make.height.equalTo(20);
        }];
        
        /** 价格   */
        UILabel *priceLable = [[UILabel alloc] init];
        priceLable.textColor = [UIColor orangeColor];
        priceLable.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:priceLable];
        self.priceLable = priceLable;
        [priceLable makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLable.left);
            make.bottom.equalTo(self.contentView).offset(-space);
            make.size.equalTo(CGSizeMake(100, 15));
        }];
        
        /** 购买量   */
        UILabel *buyCountLable = [[UILabel alloc] init];
        buyCountLable.textAlignment = NSTextAlignmentRight;
        buyCountLable.textColor = [UIColor grayColor];
        buyCountLable.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:buyCountLable];
        self.buyCountLable = buyCountLable;
        [buyCountLable makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(iconImageView.bottom);
            make.right.equalTo(titleLable.right);
            make.size.equalTo(CGSizeMake(150, 14));
        }];

    }
    return self;
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
