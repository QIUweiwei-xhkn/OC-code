//
//  QPushTableViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import "QPushTableViewController.h"
#import "QScoreTableViewController.h"
#import "QAwardTableViewController.h"

@interface QPushTableViewController ()
@end

@implementation QPushTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGroup1];
}

// 添加第一组数据
-(void)setGroup1 {
    // 第一组
    QSettingArrowItem *item0 = [QSettingArrowItem initWithTitle:@"开奖推送"];
    item0.desVC = [QAwardTableViewController class];
    QSettingArrowItem *item1 = [QSettingArrowItem initWithTitle:@"比分直播"];
    item1.desVC = [QScoreTableViewController class];
    QSettingArrowItem *item2 = [QSettingArrowItem initWithTitle:@"中奖动画"];
    QSettingArrowItem *item3 = [QSettingArrowItem initWithTitle:@"购彩大厅"];
    QSettingGroup *group = [QSettingGroup initWithItems:@[item0, item1, item2, item3]];
    [self.groupArr addObject:group];
}

@end
