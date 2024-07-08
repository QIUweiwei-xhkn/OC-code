//
//  QTableViewController.m
//  04-个人详细页
//
//  Created by wei wei on 2024/5/27.
//

#import "QTableViewController.h"

@interface QTableViewController ()

@end

@implementation QTableViewController
static NSString *ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    NSLog(@"%@", NSStringFromCGRect(self.tableView.frame));
    // 1.凡是在导航条下的scrollView，默认会设置偏移量64
//    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    // 不要自动偏移
//    self.automaticallyAdjustsScrollViewInsets = NO;// 过时了 'automaticallyAdjustsScrollViewInsets' is deprecated: first deprecated in iOS 11.0 - Use UIScrollView's contentInsetAdjustmentBehavior instead
    
    // 让导航条隐藏
//    self.navigationController.navigationBar.hidden = YES;
    
    // 导航条或是导航条上的控件设置透明度是没有效果的
//    self.navigationController.navigationBar.alpha = 0;
    
    // 设置导航条背景(必须使用UIBarMetricsDefault默认模式)
    // 当背景图片设置成nil时，系统会自动生成一张半透明图片，设为导航条背景
//    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
//    
//    UIView *headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
//    headV.backgroundColor = [UIColor blueColor];
//    self.tableView.tableHeaderView  = headV;
    
    
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        [appearance configureWithOpaqueBackground];
        NSMutableDictionary *textAttribute = [NSMutableDictionary dictionary];
        textAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];//标题颜色
        textAttribute[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];//标题大小
        [appearance setTitleTextAttributes:textAttribute];
        //去除底部黑线
        [appearance setShadowImage:[[UIImage alloc] init]];
        UIImage *color = [UIImage imageNamed:@"1"];
        appearance.backgroundImage = color;
        self.navigationController.navigationBar.standardAppearance = appearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = appearance;

}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@", NSStringFromUIEdgeInsets(self.tableView.contentInset));
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

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
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
