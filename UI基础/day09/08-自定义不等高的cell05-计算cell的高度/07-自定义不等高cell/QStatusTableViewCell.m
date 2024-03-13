//
//  QStatusTableViewCell.m
//  07-自定义不等高cell
//
//  Created by wei wei on 2024/3/13.
//

#import "QStatusTableViewCell.h"
#import "QStatus.h"

#define QTextFont [UIFont systemFontOfSize:14]
#define QNameFont [UIFont systemFontOfSize:17]
@interface QStatusTableViewCell()
/** 头像   */
@property(nonatomic, weak) UIImageView *iconImageView;
/** 昵称   */
@property(nonatomic, weak) UILabel *nameLable;
/** vip   */
@property(nonatomic, weak) UIImageView *vipImageView;
/** 正文   */
@property(nonatomic, weak) UILabel *text_Lable;
/** 图片   */
@property(nonatomic, weak) UIImageView *pictureImageView;
@end

@implementation QStatusTableViewCell

// 添加子控件原则： 把所有有可能显示的子控件都先添加进去
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /** 头像   */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        /** 昵称   */
        UILabel *nameLable = [[UILabel alloc] init];
        nameLable.font = QNameFont;
        [self.contentView addSubview:nameLable];
        self.nameLable = nameLable;
        
        /** vip   */
        UIImageView *vipImageView = [[UIImageView alloc] init];
        vipImageView.contentMode = UIViewContentModeCenter;
        vipImageView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        
        /** 正文   */
        UILabel *text_Lable = [[UILabel alloc] init];
        text_Lable.numberOfLines = 0;
        text_Lable.font = QTextFont;
        [self.contentView addSubview:text_Lable];
        self.text_Lable = text_Lable;
        
        
        /** 图片   */
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        
    }
    return self;
}


- (void)layoutSubviews  {
    [super layoutSubviews];
    CGFloat space = 10;
    /** 头像   */
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconW = 30;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconW, iconW);
    
    /** 昵称   */
    CGFloat nameX = CGRectGetMaxX(self.iconImageView.frame) + space;
    CGFloat nameY = iconY;
    NSDictionary *nameAtt = @{NSFontAttributeName : QNameFont};
    // 计算昵称文字的尺寸
    CGSize nameSize = [self.status.name sizeWithAttributes:nameAtt];
    CGFloat nameH = nameSize.height;
    CGFloat nameW = nameSize.width;
    self.nameLable.frame = CGRectMake(nameX, nameY, nameW, nameH);
    
    /** vip   */
    if(self.status.isVip) {
        CGFloat vipX = CGRectGetMaxX(self.nameLable.frame) + space;
        CGFloat vipW = 14;
        CGFloat vipH = nameH;
        CGFloat vipY = nameY;
        self.vipImageView.frame = CGRectMake(vipX, vipY, vipW, vipH);
    }
    
    /** 正文   */
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconImageView.frame) + space;
    CGFloat textW = self.contentView.frame.size.width - 2 * space;
    NSDictionary *textAtt = @{NSFontAttributeName: QTextFont};
    // 最大宽度是 textW ，高度不限制
    CGSize textSize = CGSizeMake(textW, MAXFLOAT);
//    CGFloat textH = [self.status.text sizeWithFont:QTextFont constrainedToSize:textSize].height;
    CGFloat textH = [self.status.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    self.text_Lable.frame = CGRectMake(textX, textY, textW, textH);
    
    /** 图片   */
    CGFloat cellH = 0;
    if(self.status.picture) {
        CGFloat pictureWH = 100;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(self.text_Lable.frame) + space;
        self.pictureImageView.frame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
        self.status.cellHeight = CGRectGetMaxY(self.pictureImageView.frame) + space;
    }else {
        self.status.cellHeight = CGRectGetMaxY(self.text_Lable.frame) + space;
    }
//    _cellH = cellH;
}

- (void)setStatus:(QStatus *)status {
    _status = status;
    self.iconImageView.image = [UIImage imageNamed:status.icon];
    self.nameLable.text = status.name;
    if(status.vip) {
        self.vipImageView.hidden = NO;
    }else {
        self.vipImageView.hidden = YES;
    }
    self.text_Lable.text = status.text;
    
    if(status.picture) { // 有配图
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:status.picture];
    }else { // 无配图
        self.pictureImageView.hidden = YES;
    }
}

@end
