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

- (NSArray *)carGroups {
    if(!_carGroups) {
        QCarGroup *group0 = [[QCarGroup alloc] init];
        group0.header = @"德系品牌";
        group0.footer = @"德系品牌hsieeie";
        group0.cars = @[ [QCar carWithName:@"奔驰" icon:@"0-0"],
                         [QCar carWithName:@"宝马" icon:@"0-1"],
                         [QCar carWithName:@"奥迪" icon:@"0-2"],
                         [QCar carWithName:@"保时捷" icon:@"0-3"],
                         [QCar carWithName:@"大众" icon:@"0-4"]
        ];
        QCarGroup *group1 = [[QCarGroup alloc] init];
        group1.header = @"日系品牌";
        group1.footer = @"日系品牌hiseieooe";
        group1.cars = @[ [QCar carWithName:@"丰田" icon:@"1-0"],
                         [QCar carWithName:@"马自达" icon:@"1-1"],
                         [QCar carWithName:@"本田" icon:@"1-2"],
                         [QCar carWithName:@"日产" icon:@"1-3"]
        ];
        _carGroups = @[group0, group1];
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
