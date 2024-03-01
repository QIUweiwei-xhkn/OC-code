//
//  ViewController.m
//  05-展示单组数据
//
//  Created by wei wei on 2024/3/1.
//

#import "ViewController.h"
#import "QWine.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
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
    self.tableView.delegate = self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wineArray.count;
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // 设置右边显示的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
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


#pragma mark - UITableViewDelegate
/**
 *  用户选中某一行cell会调用这个方法
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中了%ld行",indexPath.row);
}

/**
 *  用户取消选中某一行cell会调用这个方法
 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消选中了%ld行",indexPath.row);
}

/**
 *  返回每一组的头部控件
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}

/**
 *  返回每一组的尾部控件
 */
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//
//}

/**
 *  返回每一组的头部高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

/**
 *  返回每一组的尾部高度
 */
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    
//}

/**
 *  返回每一行cell的高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0) {
        return 100;
    }else
        return 50;
}
@end
