//
//  ViewController.m
//  01-购物车案例
//
//  Created by wei wei on 2024/4/1.
//

#import "ViewController.h"
#import "QWineCell.h"
#import "MJExtension.h"
#import "QWine.h"

@interface ViewController () <UITableViewDataSource, QWineCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 酒模型   */
@property(nonatomic, strong) NSArray *wineArray;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLable;
@property (weak, nonatomic) IBOutlet UIButton *buyButton;
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
/** 购物车对象   */
@property(nonatomic, strong) NSMutableArray *shoppingCar;
@end

@implementation ViewController
- (NSMutableArray *)shoppingCar {
    if(!_shoppingCar) {
        _shoppingCar = [NSMutableArray array];
    }
    return _shoppingCar;
}

- (NSArray *)wineArray {
    if(!_wineArray) {
        _wineArray = [QWine mj_objectArrayWithFilename:@"wine.plist"];
//        for (QWine *wine in self.wineArray) {
//            [wine addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
//        }
    }
    return _wineArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 监听通知
//    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
//    [center addObserver:self selector:@selector(plusClick:) name:@
//     "plusClickNotification" object:nil];
//    [center addObserver:self selector:@selector(minusClick:) name:@
//     "minusClickNotification" object:nil];
}

//-(void)dealloc {
//    // 移除监听
////    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    for (QWine *wine in self.wineArray) {
//        [wine removeObserver:self forKeyPath:@"count"];
//    }
//}

#pragma mark - QWineCellDelegate
-(void)QWineCellDidClickPlusButton:(QWineCell *)cell {
//    NSLog(@"QWineCellDidClickPlusButton--");
    // 计算总价
    int totalPrice = self.totalPriceLable.text.intValue + cell.wine.money.intValue;
    // 设置总价
    self.totalPriceLable.text = [NSString stringWithFormat:@"%d", totalPrice];
//    NSLog(@"plusClick---");
    self.buyButton.enabled = YES;
    self.clearButton.enabled = YES;
    if(![self.shoppingCar containsObject:cell.wine]) {
        [self.shoppingCar addObject:cell.wine];
    }
}
-(void)QWineCellDidClickminusButton:(QWineCell *)cell {
    // 计算总价
    int totalPrice = self.totalPriceLable.text.intValue - cell.wine.money.intValue;
    // 设置总价
    self.totalPriceLable.text = [NSString stringWithFormat:@"%d", totalPrice];
    self.buyButton.enabled = (self.totalPriceLable.text.intValue > 0);
    self.clearButton.enabled = (self.totalPriceLable.text.intValue > 0);
    if(cell.wine.count == 0) {
        [self.shoppingCar removeObject:cell.wine];
    }
}
#pragma mark - KVO
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(QWine *)wine change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    // NSKeyValueChangeNewKey == @"new"
    int new = [change[NSKeyValueChangeNewKey] intValue];
    // NSKeyValueChangeOldKey == @"old"
    int old = [change[NSKeyValueChangeOldKey] intValue];
//    NSLog(@"observeValueForKeyPath----");
    if(new > old) { // 数量增加，点击加号
        // 计算总价
        int totalPrice = self.totalPriceLable.text.intValue + wine.money.intValue;
        // 设置总价
        self.totalPriceLable.text = [NSString stringWithFormat:@"%d", totalPrice];
        self.buyButton.enabled = YES;
        self.clearButton.enabled = YES;
    }else { // 数量减少，点击减号
        // 计算总价
        int totalPrice = self.totalPriceLable.text.intValue - wine.money.intValue;
        // 设置总价
        self.totalPriceLable.text = [NSString stringWithFormat:@"%d", totalPrice];
        self.buyButton.enabled = (self.totalPriceLable.text.intValue > 0);
        self.clearButton.enabled = (self.totalPriceLable.text.intValue > 0);
    }
}

#pragma mark - 监听通知
-(void)plusClick:(NSNotification *)note {
    // 发布者
    QWineCell *cell = note.object;
    // 计算总价
    int totalPrice = self.totalPriceLable.text.intValue + cell.wine.money.intValue;
    // 设置总价
    self.totalPriceLable.text = [NSString stringWithFormat:@"%d", totalPrice];
//    NSLog(@"plusClick---");
    self.buyButton.enabled = YES;
    self.clearButton.enabled = YES;
}

-(void)minusClick:(NSNotification *)note {
    // 发布者
    QWineCell *cell = note.object;
    // 计算总价
    int totalPrice = self.totalPriceLable.text.intValue - cell.wine.money.intValue;
    // 设置总价
    self.totalPriceLable.text = [NSString stringWithFormat:@"%d", totalPrice];
//    if(self.totalPriceLable.text.intValue == 0) {
//        self.buyButton.enabled = NO;
//        self.clearButton.enabled = NO;
//    }
    self.buyButton.enabled = (self.totalPriceLable.text.intValue > 0);
    self.clearButton.enabled = (self.totalPriceLable.text.intValue > 0);
//    NSLog(@"minusClick----");
}
#pragma mark - 按钮点击
- (IBAction)cleer {
    for (QWine *wine in self.wineArray) {
        wine.count = 0;
    }
    self.totalPriceLable.text = @"0";
    [self.tableView reloadData];
    // 购买按钮一定不能点击
    self.buyButton.enabled = NO;
    self.clearButton.enabled = NO;
    [self.shoppingCar removeAllObjects];
}
- (IBAction)buy {
    // 打印购买的酒
    for (QWine *wine in self.shoppingCar) {
        NSLog(@"购买了%d瓶%@", wine.count, wine.name);
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"wine";
    QWineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    cell.vc = self;
    
    // 传递模型
    cell.wine = self.wineArray[indexPath.row];
    cell.delegate = self;
    return cell;
}
-(void)plusClick_vc {
    
}
-(void)minusClick_vc {
    
}
@end
