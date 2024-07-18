//
//  QSettingTableViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/17.
//

#import "QSettingTableViewController.h"
#import "QPushTableViewController.h"  
#import "MBProgressHUD+XMG.h"

@interface QSettingTableViewController ()

@end

@implementation QSettingTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setGroup1];
    [self setGroup2];
    [self setGroup3];
    
    //    self.navigationItem.title = @"设置";
    self.title = @"设置";
}

// 添加第一组数据
-(void)setGroup1 {
    // 第一组
    QSettingItem *item = [QSettingItem initWithIcon:[UIImage imageNamed:@"RedeenCode"] title:@"使用兑换码"];
    QSettingGroup *group = [QSettingGroup initWithItems:@[item]];
    group.headerTitle = @"123";
    group.footTitle = @"2kfkorkr";
    [self.groupArr addObject:group];
}

// 添加第儿组数据
-(void)setGroup2 {
    // 第二组
    QSettingArrowItem *item10 = [QSettingArrowItem initWithIcon:[UIImage imageNamed:@"RedeenCode"] title:@"推送和提醒"];
    item10.desVC = [QPushTableViewController class];
    QSettingItem *item11 = [QSettingSwitchItem initWithIcon:[UIImage imageNamed:@"handShake"] title:@"使用摇一摇机选"];
    item11.on = YES;
    QSettingItem *item12 = [QSettingSwitchItem initWithIcon:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    QSettingItem *item13 = [QSettingSwitchItem initWithIcon:[UIImage imageNamed:@"RedeenCode"] title:@"购彩小助手"];
    QSettingGroup *group = [QSettingGroup initWithItems:@[item10, item11, item12, item13]];
    group.headerTitle = @"";
    group.footTitle = @"2e99999-orkr";
    [self.groupArr addObject:group];
    
}



// 添加第三组数据
-(void)setGroup3 {
    // 第三组
    QSettingItem *item20 = [QSettingArrowItem initWithIcon:[UIImage imageNamed:@"RedeenCode"] title:@"检查新版本"];
    item20.operationBlock = ^(NSIndexPath *indexPath){
        [MBProgressHUD showSuccess:@"没有版本更新"];
    };
    QSettingItem *item21 = [QSettingArrowItem initWithIcon:[UIImage imageNamed:@"RedeenCode"] title:@"分享"];
    item21.operationBlock = ^(NSIndexPath *indexPath){
        [MBProgressHUD showSuccess:@"没有东西分享jfjjfjj"];
    };
    QSettingItem *item22 = [QSettingArrowItem initWithIcon:[UIImage imageNamed:@"RedeenCode"] title:@"产品推荐"];
    QSettingItem *item23 = [QSettingArrowItem initWithIcon:[UIImage imageNamed:@"RedeenCode"] title:@"关于"];
    
    // block 防止循环应用
    // 你拥有我，我拥有你
    // block 会对代码块里面的强制针强引用
    
//    __weak QSettingTableViewController *weakVC = self;
//    typeof() 动态根据x的值判断x的类型
//    int a = 10;
//    typeof(1) b = 10;
//    NSLog(@"a %d b %d", a, b);
    __weak typeof(self) weakVC = self;
    
    item23.operationBlock = ^(NSIndexPath *indexPath){
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = @"orhucoro";
        vc.view.backgroundColor = [UIColor redColor];
//        __strong
//        NSLog(@"%@",self);
        [weakVC.navigationController pushViewController:vc animated:YES];
        
        // self -> gruops
        // 在block中如果访问下划线的成员属性，会造成循环引用
//        NSLog(@"%@",_groupArr); // 造成循环引用
        NSLog(@"%@", weakVC.groupArr); // 不造成循环引用
    };
    QSettingGroup *group = [QSettingGroup initWithItems:@[item20, item21, item22, item23]];
    group.headerTitle = @"kfkkfk";
    group.footTitle = @"endendend";
    [self.groupArr addObject:group];
}


@end
