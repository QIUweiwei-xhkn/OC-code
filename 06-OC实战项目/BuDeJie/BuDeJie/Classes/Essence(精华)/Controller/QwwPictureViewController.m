//
//  QwwPictureViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/16.
//

#import "QwwPictureViewController.h"

@interface QwwPictureViewController ()

@end

@implementation QwwPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = QRrandColor;
    self.tableView.contentInset = UIEdgeInsetsMake(35, 0, 0, 0);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarButtonDidRepeateClick) name:QWWtabBarButtonDidRepeatClickNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(titleButtoDidRepeateClick) name:QWWtitleButtonDidRepeatClickNotification object:nil];
}

#pragma mark - 监听
/// 监听tabBarButton重复点击
- (void)tabBarButtonDidRepeateClick {
//    if(重复点击的不是精华控制器) return;
    // 如果重复点击的不是精华控制器，当前现实的控制器就不是精华控制器，那么self.view.window为空
    if(self.view.window == nil) return;
//    if(显示在正中间的tableView不是allTableView) return;
    if(!self.tableView.scrollsToTop) return;
    // 刷新数据
    NSLog(@"%s",__func__);
}

/// 监听titleButto重复点击
- (void)titleButtoDidRepeateClick {
//    if(显示在正中间的tableView不是allTableView) return;
    if(!self.tableView.scrollsToTop) return;
    // 刷新数据
    NSLog(@"%s",__func__);
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, -- %zd",[self class], indexPath.row];
    return cell;
}

@end
