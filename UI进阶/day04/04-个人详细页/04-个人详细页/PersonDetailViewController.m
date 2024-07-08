//
//  PersonDetailViewController.m
//  04-个人详细页
//
//  Created by wei wei on 2024/7/6.
//

#import "PersonDetailViewController.h"
#import "UIImage+Image.h"
#define originHeight 200

@interface PersonDetailViewController () <UITableViewDelegate, UITableViewDataSource >
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hightContr;

@end

@implementation PersonDetailViewController
static NSString *ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    NSLog(@"%@", NSStringFromCGRect(self.tableView.frame));
    // 1.凡是在导航条下的scrollView，默认会设置偏移量64
//    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    // 不要自动偏移
//    self.automaticallyAdjustsScrollViewInsets = NO;// 过时了 'automaticallyAdjustsScrollViewInsets' is deprecated: first deprecated in iOS 11.0 - Use UIScrollView's contentInsetAdjustmentBehavior instead
    
    // 让导航条隐藏
    self.navigationController.navigationBar.hidden = YES;
    
    // 导航条或是导航条上的控件设置透明度是没有效果的
//    self.navigationController.navigationBar.alpha = 0;
    
    // 设置导航条背景(必须使用UIBarMetricsDefault默认模式)
    // 当背景图片设置成nil时，系统会自动生成一张半透明图片，设为导航条背景
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];//导航栏背景颜色
    self.navigationController.navigationBar.translucent = YES;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.navigationController.navigationBar.hidden = NO;
    NSLog(@"%f",scrollView.contentOffset.y);
    if(self.hightContr.constant < 0)
        self.hightContr.constant = originHeight;
    self.hightContr.constant = originHeight - scrollView.contentOffset.y;
    // 创建了一个 UINavigationBarAppearance 对象，用于自定义导航栏的外观
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
//    // 使用 configureWithOpaqueBackground 方法配置导航栏具有不透明的背景。
//    [appearance configureWithOpaqueBackground];
    // 将导航栏底部的阴影图像设置为一个新创建的空图像，以去除底部黑线。
    [appearance setShadowImage:[[UIImage alloc] init]];
    // 修改导航条背景图片
    // 根据透明度来生成图片
    CGFloat alpha = (originHeight - self.hightContr.constant) / 200;
    if(alpha > 1)
        alpha = 0.99;
    // 修改导航条的背景图片
    // 用透明度生成颜色
    UIColor *alphaColor = [UIColor colorWithWhite:1 alpha:alpha];
    // 把颜色生成图片
    UIImage *alphaImage = [UIImage imageWithColor:alphaColor];
    // 修改导航条的背景图片
    appearance.backgroundImage = alphaImage;
    NSLog(@"alpha === %f", alpha);
    
    self.navigationController.navigationBar.standardAppearance = appearance;
    self.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    NSLog(@"%p",cell);
    cell.textLabel.text = @"123";
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
