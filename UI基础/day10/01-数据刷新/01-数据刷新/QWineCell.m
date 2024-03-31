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
@end

@implementation QWineCell

- (void)setWine:(QWine *)wine {
    _wine = wine;
    self.textLabel.text = wine.name;
    self.imageView.image = [UIImage imageNamed:wine.image];
    self.detailTextLabel.text = [NSString stringWithFormat:@"¥%@", wine.money];
}


@end
