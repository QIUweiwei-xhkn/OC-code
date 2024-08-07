//
//  QCellItem.m
//  02-Block在开发中使用场景（保存代码）
//
//  Created by wei wei on 2024/8/6.
//

#import "QCellItem.h"

@implementation QCellItem

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+(instancetype)cellInitWithTitle:(NSString *)title {
    QCellItem *cell = [[QCellItem alloc] init];
    cell.title = title;
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
