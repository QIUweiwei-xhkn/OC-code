//
//  QwwNormalHeaderView.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/24.
//

#import "QwwNormalHeaderView.h"

@implementation QwwNormalHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 自动切换透明度
        self.automaticallyChangeAlpha = YES;
        self.lastUpdatedTimeLabel.hidden = YES;
        self.stateLabel.textColor = [UIColor redColor];
        self.stateLabel.font = [UIFont systemFontOfSize:17];
        [self setTitle:@"下拉🐎上刷新" forState:MJRefreshStateIdle];
        [self setTitle:@"松开🐎上刷新" forState:MJRefreshStatePulling];
        [self setTitle:@"正在拼命刷新中" forState:MJRefreshStateRefreshing];
        // 自动切换透明度
        self.automaticallyChangeAlpha = YES;
    }
    return self;
}

@end
