//
//  QwwVoiceCell.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/19.
//

#import "QwwVoiceCell.h"

@implementation QwwVoiceCell

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
        // 增加中间的声音控件，并添加约束
        // ……
        UILabel *lable = [[UILabel alloc] init];
        lable.text = NSStringFromClass([self class]);
        [lable sizeToFit];
        [self.contentView addSubview:lable];
    }
    return self;
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    // 设置中间的声音控件的frame
//}

- (void)setTopic:(QwwTopicItem *)topic {
    [super setTopic:topic];
    
    // 设置中间的声音控件的具体数据（如文字数据，声音数据）
}
@end
