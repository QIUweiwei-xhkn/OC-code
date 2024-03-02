//
//  ViewController.m
//  02-展示汽车数据
//
//  Created by wei wei on 2024/2/27.
//

#import "ViewController.h"
#import "QCarGroup.h"
#import "QCar.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *UItableVIew;

/** 所有的车数据   */
@property(nonatomic, strong) NSArray *carGroups;
@end

@implementation ViewController

// plist
- (NSArray *)carGroups {
    if(!_carGroups) {
        
        // 1.加载字典数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        
        // 2.创建模型数组
        NSMutableArray *temp = [NSMutableArray array];
        
        // 3.字典数组 转 模型数组
        for (NSDictionary *carGroupDict in dictArray) {
            QCarGroup *group = [QCarGroup carGroupWithDict:carGroupDict];
            [temp addObject:group];
        }
        _carGroups = temp;
    }
    return _carGroups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.UItableVIew.dataSource = self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 取出第sectoin组的组模型
    QCarGroup *group = self.carGroups[section];
    return group.cars.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    // 设置cell右边显示的控件 优先级 > 设置cell右边的指示样式
//    cell.accessoryView = [[UISwitch alloc] init];
    /* 设置cell右边的指示样式
     UITableViewCellAccessoryNone,
     UITableViewCellAccessoryDisclosureIndicator,
     UITableViewCellAccessoryDetailDisclosureButton,
     UITableViewCellAccessoryCheckmark,
     UITableViewCellAccessoryDetailButton,
     */
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 取出indexPath.section这组的组模型
    QCarGroup *group = self.carGroups[indexPath.section];
    
    // 取出indexPath.row对应的车模型
    QCar *car = group.cars[indexPath.row];
    
    // 设置数据
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    return cell;
}

/**
 *  告诉tableView每一组的头部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // 取出indexPath.section这组的组模型
    QCarGroup *group = self.carGroups[section];
    return group.header;
}

/**
 *  告诉tableView每一组的尾部标题
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    // 取出indexPath.section这组的组模型
    QCarGroup *group = self.carGroups[section];
    return group.footer;
}
@end
