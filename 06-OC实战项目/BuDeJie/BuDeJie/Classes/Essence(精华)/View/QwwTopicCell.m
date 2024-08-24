//
//  QwwTopicCell.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/19.
//

#import "QwwTopicCell.h"
#import "QwwTopicItem.h"

@implementation QwwTopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 增加顶部控件，并添加约束
        // ……
        // 增加底部控件，并添加约束
        // ……
        self.backgroundColor = QRrandColor;
        UISwitch *sw = [[UISwitch alloc] init];
        [self.contentView addSubview:sw];
    }
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    // 设置顶部和底部的frame
//}

- (void)setTopic:(QwwTopicItem *)topic {
    _topic = topic;
    
    // 设置顶部和底部控件的具体数据（如文字数据，图片数据）
}
@end
