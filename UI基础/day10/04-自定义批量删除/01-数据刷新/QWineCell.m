//
//  QWineCell.m
//  01-数据刷新
//
//  Created by wei wei on 2024/3/25.
//

#import "QWineCell.h"
#import "QWine.h"
#import "Masonry.h"

@interface QWineCell()
/** 打勾控件   */
@property(nonatomic, weak) UIImageView *checkImageView;
@end


@implementation QWineCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 添加子控件
        UIImageView *checkImageView = [[UIImageView alloc] init];
        checkImageView.image = [UIImage imageNamed:@"check"];
        checkImageView.hidden = YES;
        [self.contentView addSubview:checkImageView];
        self.checkImageView = checkImageView;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置打勾控件位置和尺寸
    CGFloat WH = 24;
    CGFloat X = self.contentView.frame.size.width - WH - 10;
    CGFloat Y = (self.contentView.frame.size.height - WH) * 0.5;
    self.checkImageView.frame = CGRectMake(X, Y, WH, WH);
    
    // 调整textLable的宽度
    CGRect frame = self.textLabel.frame;
    frame.size.width = self.contentView.frame.size.width - self.textLabel.frame.origin.x - WH - 20;
    self.textLabel.frame = frame;
    
}

- (void)setWine:(QWine *)wine {
    _wine = wine;
    self.textLabel.text = wine.name;
    self.imageView.image = [UIImage imageNamed:wine.image];
    self.detailTextLabel.text = [NSString stringWithFormat:@"¥%@", wine.money];
    // 根据模型的check属性来确定打勾控件是显示还是隐藏
    if(wine.isChecked) {
        self.checkImageView.hidden = NO;
    }else {
        self.checkImageView.hidden = YES;
    }
        
    
}


    
@end

