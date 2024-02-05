//
//  ViewController.m
//  03-综合案例
//
//  Created by wei wei on 2024/1/29.
//

#import "ViewController.h"
#import "Shop.h"
#import "QShopView.h"

@interface ViewController ()
// 购物车
@property (weak, nonatomic) IBOutlet UIImageView *shopCarVIew;
// 添加按钮
@property (weak, nonatomic) IBOutlet UIButton *addButton;
// 删除按钮
@property (strong, nonatomic) IBOutlet UIButton *removeButton;

// 数据数组
@property(nonatomic, strong)NSArray *dataArr;
@end

@implementation ViewController
-(NSArray *)dataArr {
    if(_dataArr == nil) {
        // 1.获取全路径
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"shopdata.plist" ofType:nil];
        self.dataArr = [NSArray arrayWithContentsOfFile:dataPath];
        // 字典转模型
        // 创建临时数组
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in self.dataArr) {
            // 创建shop对象
            Shop *shop = [[Shop alloc] init];
            shop.name = dict[@"name"];
            shop.icon = dict[@"icon"];
            // 把模型装入数组
            [tempArr addObject:shop];
        }
        self.dataArr = tempArr;
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 添加到购物车
- (IBAction)add:(UIButton *)button {
    /*****************************定义一些变量*************************************/
    // 1.总列数
    NSInteger allCols = 3;
    // 2.商品的宽度 和 高度
    CGFloat width = 80;
    CGFloat heigth = 100;
    // 3.水平间距 和 垂直间距
    CGFloat hMargin = (self.shopCarVIew.frame.size.width - allCols * width) / (allCols - 1);
    CGFloat vMargin = (self.shopCarVIew.frame.size.height - heigth * 2);
    // 4. 设置索引
    NSInteger index = self.shopCarVIew.subviews.count;
    // 4.求出X值
    CGFloat x = (hMargin + width) * (index % allCols);
    // 5.求出Y值
    CGFloat y = (vMargin + heigth) * (index / allCols);
    
    /*********************创建一个商品*************************/
    /*
     // 创建商品的View
     UIView *shopView = [[UIView alloc] init];
     // 设置frame
     shopView.frame = CGRectMake(x, y, width, heigth);
     // 设置背景颜色
     shopView.backgroundColor = [UIColor greenColor];
     // 添加到购物车
     [self.shopCarVIew addSubview:shopView];
     
     // 创建商品UIImageView对象
     UIImageView *iconView = [[UIImageView alloc] init];
     iconView.frame = CGRectMake(0, 0, width, width);
     iconView.backgroundColor = [UIColor blueColor];
     [shopView addSubview:iconView];
     
     // 创建商品标题对象
     UILabel *titleLable = [[UILabel alloc] init];
     titleLable.frame = CGRectMake(0, width, width, heigth - width);
     titleLable.textAlignment = NSTextAlignmentCenter;
     titleLable.backgroundColor = [UIColor redColor];
     [shopView addSubview:titleLable];
     */
   
    
     QShopView *shopView = [[QShopView alloc] init];
     shopView.frame = CGRectMake(x, y, width, heigth);
     [self.shopCarVIew addSubview:shopView];

    
    /**********************设置数据****************************/
    // 设置数据
    
    Shop *shop = self.dataArr[index];
    shopView.iconView.image = [UIImage imageNamed:shop.icon];
    shopView.titleLable.text = shop.name;
    
    /*****************设置按钮状态***********************/
    button.enabled = (index != 5);
    
    // 设置删除按钮状态
    self.removeButton.enabled = YES;
}

// 从购物车中删除
- (IBAction)remove:(UIButton *)button {
    // 1.删除最后一个商品
    UIView *lastShopView = [self.shopCarVIew.subviews lastObject];
    [lastShopView removeFromSuperview];
    
    // 3.设置添加按钮状态
    self.addButton.enabled = YES;
    
    // 设置删除按钮状态
    self.removeButton.enabled = (self.shopCarVIew.subviews.count != 0);
}

@end
