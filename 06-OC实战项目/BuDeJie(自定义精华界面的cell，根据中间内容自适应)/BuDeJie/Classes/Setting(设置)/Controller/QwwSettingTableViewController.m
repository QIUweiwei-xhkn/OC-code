//
//  QwwSettingTableViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/10.
//

#import "QwwSettingTableViewController.h"
#import "SDImageCache.h"
#import "QwwFIleTool.h"
#import "SVProgressHUD.h"

#define CachesPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
@interface QwwSettingTableViewController ()
/** <#注释#>   */
@property(nonatomic, assign) NSInteger totalSize;
@end

@implementation QwwSettingTableViewController
static NSString * const ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", CachesPath);
    self.navigationItem.title = @"设置";
    
    // 必须在转跳前调用
//    self.hidesBottomBarWhenPushed = YES;
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImage:[UIImage imageNamed:@"navigationButtonReturn"] WithSelectedImage:[UIImage imageNamed:@"navigationButtonReturnClick"] target:self action:@selector(back) title:@"返回"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"jump" style:0 target:self action:@selector(jump)];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    [SVProgressHUD showWithStatus:@"正在计算缓存尺寸……"];
    // 获得文件夹尺寸
    // 文件夹较小时使用， 如果文件夹尺寸较大，界面会卡在加载界面且没有提示
    [QwwFIleTool getFileSize:CachesPath compeletion:^(NSInteger totolSize) {
        self.totalSize = totolSize;
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    }];
}

- (void)jump {
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
}

//#pragma mark - 点击返回按钮
//- (void)back {
//    [self.navigationController popViewControllerAnimated:YES];
//}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = @"清除缓存";
    // 计算缓存数据，计算鉴个应用程序缓存数据=>沙盒（Cache）=>获取cache文件夹尺寸
    // SDWebImage：帮我们做了缓存
//    NSInteger size = [SDImageCache sharedImageCache].getSize;   // Property 'getSize' not found on object of type 'SDImageCache *'
    
//    NSLog(@"%@", [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]);
//    // 获得caches文件夹的路径
//    NSString *CachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    // 获得default文件路径
//    NSString *defaultPath = [CachesPath stringByAppendingPathComponent:@"com.hackemist.SDImageCache/default"];
    
    // 获得缓存尺寸字符串
    cell.textLabel.text = [self sizeStr];
    
    return cell;
}

// 点击cell调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 清除缓存
    [QwwFIleTool removeData:CachesPath];
    _totalSize = 0;
    [self.tableView reloadData];
    
}

 // 获得缓存尺寸字符串
- (NSString *)sizeStr {
    // 获得caches文件夹路径
//    NSString *CachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];

    NSString *sizeStr = @"清除缓存";
    NSInteger totalSize = self.totalSize;
    // GB MB KB B
    if(totalSize > 1000 * 1000 * 1000) {
        // GB
        CGFloat sizeF = totalSize / (1000 * 1000 * 1000);
        sizeStr = [NSString stringWithFormat:@"%@(%.1fGB)", sizeStr, sizeF];
    }else if(totalSize > 1000 * 1000) {
        // MB
        CGFloat sizeF = totalSize / (1000 * 1000);
        sizeStr = [NSString stringWithFormat:@"%@(%.1fMB)", sizeStr, sizeF];
    }else if(totalSize > 1000) {
        // KB
        CGFloat sizeF = totalSize / 1000;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fKB)", sizeStr, sizeF];
    }else if(totalSize > 0) {
        // B
        sizeStr = [NSString stringWithFormat:@"%@(%ldB)", sizeStr, totalSize];
    }
    return sizeStr;
}


@end
