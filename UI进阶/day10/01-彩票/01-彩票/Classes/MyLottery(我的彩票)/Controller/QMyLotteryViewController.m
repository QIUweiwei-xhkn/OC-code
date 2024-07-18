//
//  QMyLotteryViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/13.
//

#import "QMyLotteryViewController.h"
#import "QSettingTableViewController.h"

@interface QMyLotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation QMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置button的背景图片
    // 1.1 拿到button的背景图片
    UIImage *image = self.loginBtn.currentBackgroundImage;
    // 1.2 拉伸图片
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    // 1.3 设置背景图片
    [self.loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    
    // 2. 设置导航条左侧按钮
    UIButton *btn = [[UIButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"FBMM_BarButton"] forState:UIControlStateNormal];
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // 2. 设置导航条右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithRenderOriginalName:@"Setting_BarButton"] style:UIBarButtonItemStylePlain target:self action:@selector(config)];
}

// 当右侧按钮点击时调用
- (void)config {
//    NSLog(@"%s",__func__);
    QSettingTableViewController *settingVC = [[QSettingTableViewController alloc] init];
//    settingVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:settingVC animated:YES];
}
@end
