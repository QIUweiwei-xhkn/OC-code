//
//  ViewController.m
//  09-自定义流水布局
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "FlowLayout.h"

// UICollectionView使用注意点
// 1.创建UICollectionView必须要有布局參数
// 2.cell必须通过注册
// 3.cell必须自定义，系统cell没有任何子控件

#define ScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController () <UICollectionViewDataSource>

@end

@implementation ViewController
static NSString * const ID = @"cell";
// 函数式编程思想（高聚合）：把许多功能放在一个函数块（block）里处理
// 编程思想：低耦合，高聚合（代码集合，方便管理）
/*
    另一种封装方式
     int c = ({
         int a = 3;
         int b = 3;
         a + b;
     });
     
    //    int a = 3;
    //    int b = 3;
    //    int c = a + b;
 NSLog(@"%d", c);
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    // 流水布局:调整cell尺寸
    //    UICollectionViewFlowLayout *flowLayer = [self setupUICollectionViewFlowLayout];
    //
    //    // 创建的UICollectionView默认透明
    //    [self setupUICollectionView:flowLayer];
    
    
    // 流水布局:调整cell尺寸
    // 流水布局
    FlowLayout *flowLayer = ({
        FlowLayout *flowLayer = [[FlowLayout alloc] init];
        flowLayer.itemSize = CGSizeMake(160, 160);
        // 设置滚动方向
        flowLayer.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        // 设置内边距
        CGFloat margin = (ScreenW - 160) * 0.5;
        flowLayer.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
        
        // 设置最小行边距
        flowLayer.minimumLineSpacing = 50;
        flowLayer;
    });
    
    // 创建的UICollectionView默认透明
    UICollectionView *collectionView = ({
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayer];
        collectionView.center = self.view.center;
        collectionView.backgroundColor = [UIColor redColor];
        collectionView.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 200);
        // 取消滚动条
        collectionView.showsHorizontalScrollIndicator = NO;
        
        // 设置数据源
        collectionView.dataSource = self;
        
        // 注册cell
        [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
        collectionView;
    });
    
    [self.view addSubview:collectionView];
}

#pragma mark - 创建流水布局
- (UICollectionViewFlowLayout *)setupUICollectionViewFlowLayout {
    // 流水布局:调整cell尺寸
    UICollectionViewFlowLayout *flowLayer = [[UICollectionViewFlowLayout alloc] init];
    flowLayer.itemSize = CGSizeMake(160, 160);
    // 设置滚动方向
    flowLayer.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置内边距
    CGFloat margin = (ScreenW - 160) * 0.5;
    flowLayer.sectionInset = UIEdgeInsetsMake(0, margin, 0, margin);
    
    // 设置最小行边距
    flowLayer.minimumLineSpacing = 50;
    // 设置最小的item边距 不一定会生效
//    flowLayer.minimumInteritemSpacing = 50;
    return flowLayer;
}

#pragma mark - 创建collectionView
- (void)setupUICollectionView:(UICollectionViewFlowLayout *)flowLayer {
    // 创建的UICollectionView默认透明
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayer];
    collectionView.center = self.view.center;
    collectionView.backgroundColor = [UIColor redColor];
    collectionView.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    // 取消滚动条
    collectionView.showsHorizontalScrollIndicator = NO;
    
    [self.view addSubview:collectionView];
    
    // 设置数据源
    collectionView.dataSource = self;
    
    // 注册cell
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([PhotoCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    if(cell == nil) {
//        cell = [[UICollectionViewCell alloc] init];
//    }
//    cell.backgroundColor = [UIColor blueColor];
    
    NSString *name = [NSString stringWithFormat:@"%ld", indexPath.row + 1];
    cell.image = [UIImage imageNamed:name];
    
    return cell;
}
@end
