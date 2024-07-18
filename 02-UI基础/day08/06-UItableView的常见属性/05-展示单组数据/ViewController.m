//
//  ViewController.m
//  05-展示单组数据
//
//  Created by wei wei on 2024/3/1.
//

#import "ViewController.h"
#import "QWine.h"

@interface ViewController () <UITableViewDataSource>
/** 所有酒数据   */
@property(nonatomic, strong) NSArray *wineArray;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController
- (NSArray *)wineArray {
    if(!_wineArray) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine.plist" ofType:nil]];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *wineDict in dictArray) {
            [temp addObject:[QWine wineWithDict:wineDict]];
        }
        _wineArray = temp;
    }
    return _wineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    // 设置tableView每一行cell的高度
    self.tableView.rowHeight = 100;
    
    // 设置tableView每一行的头部高度
    self.tableView.sectionHeaderHeight = 80;
    // 设置tableView每一行的尾部高度
    self.tableView.sectionFooterHeight = 100;
    // 设置tableView每一行分割线的颜色  （透明色 clearColor）
    self.tableView.separatorColor = [UIColor redColor];
    
    // 设置tableView每一行分割线的样式
    /*
     UITableViewCellSeparatorStyleNone, 无分割线
     UITableViewCellSeparatorStyleSingleLine, 默认
     UITableViewCellSeparatorStyleSingleLineEtched
     */
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    // 设置表头控件
    self.tableView.tableHeaderView = [[UISwitch alloc] init];
    // 设置表尾控件
    self.tableView.tableFooterView = [[UISwitch alloc] init];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wineArray.count;
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    
    // 取出对应酒模型
    QWine *wine = self.wineArray[indexPath.row];
    
    cell.textLabel.text = wine.name;
    cell.imageView.image = [UIImage imageNamed:wine.image];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"¥%@",wine.money];
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"头部";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"尾部";
}
@end
