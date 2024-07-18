//
//  QCircleButton.m
//  01-购物车案例
//
//  Created by wei wei on 2024/4/1.
//

#import "QCircleButton.h"

@implementation QCircleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    // 设置边框宽度
    self.layer.borderWidth = 1.0;
    // 设置边框颜色
    self.layer.borderColor = [UIColor redColor].CGColor;
    // 设置边框圆角半径
    self.layer.cornerRadius = self.frame.size.width * 0.5;
}
@end
