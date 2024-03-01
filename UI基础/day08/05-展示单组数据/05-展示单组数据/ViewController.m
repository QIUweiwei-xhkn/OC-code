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
}

#pragma mark - UITableViewDataSource
// 如果不实现 默认是一组
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

// secction = 0
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wineArray.count;
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 取出对应酒模型
    QWine *wine = self.wineArray[indexPath.row];
    
    cell.textLabel.text = wine.name;
    cell.imageView.image = [UIImage imageNamed:wine.image];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"¥%@",wine.money];
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    return cell;
}
@end
