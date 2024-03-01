//
//  ViewController.m
//  01-展示多组数据
//
//  Created by wei wei on 2024/2/27.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设计数据源
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDataSource
/**
 *  告诉tableVIew一共有多少组数据
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

/**
 *  告诉tableVIew第section组右多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0)  {
        // 第0组
        return 2;
    }else if(section == 1) {
        // 第1组
        return 6;
    }else if(section == 2) {
        // 第2组
        return 6;
    }else
        // 最后一组
        return 1;
}

/**
 *  告诉VUITableView每一行显示的内容（tableVIew每一行都是UITableViewCell或者它的子类）
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if(indexPath.section == 0) {
        // 第0组
        if(indexPath.row == 0) {
            // 第0组的第0行
            cell.textLabel.text = @"通用";
        }else if(indexPath.row == 1) {
            // 第0组的第1行
            cell.textLabel.text = @"隐私";
        }
    }else {
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld组第%zd行-其他数据",indexPath.section, indexPath.row];
    }
    
    return cell;
}
@end
