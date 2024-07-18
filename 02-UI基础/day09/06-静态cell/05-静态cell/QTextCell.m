//
//  QTextCell.m
//  05-静态cell
//
//  Created by wei wei on 2024/3/13.
//

#import "QTextCell.h"
@interface QTextCell ()
@property(nonatomic, weak) IBOutlet UISwitch *s;
@end

@implementation QTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.s.on = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
