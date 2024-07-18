//
//  QNewFeatureCollectionViewController.m
//  01-彩票
//
//  Created by wei wei on 2024/7/16.
//

#import "QNewFeatureCollectionViewController.h"
#import "QNewFeatureCollectionViewCell.h"
#define QPage 4

@interface QNewFeatureCollectionViewController ()
/** 记录上一次偏移量   */
@property(nonatomic, assign) CGFloat lastOffsetX;
/** <#注释#>   */
@property(nonatomic, weak) UIImageView *guideBall;
/** 当前耶   */
@property(nonatomic, assign) NSInteger page;

@property(nonatomic, weak) UIImageView *guideBigText;
@property(nonatomic, weak) UIImageView *guideSmallText;
@end

@implementation QNewFeatureCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    UICollectionViewFlowLayout *flowLayer = [[UICollectionViewFlowLayout alloc] init];
    // 修改item大小
    flowLayer.itemSize = [UIScreen mainScreen].bounds.size;
//    // 修改行间距
    flowLayer.minimumLineSpacing = 0;
    // 修改列间距
    flowLayer.minimumInteritemSpacing = 0;
    // 修改滚动方向
    flowLayer.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 修改每一组边距
//    flowLayer.sectionInset = UIEdgeInsetsMake( 100, 20, 30, 40); 
    
    return [super initWithCollectionViewLayout:flowLayer];
}

//

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // self.view != self.collectionView
    // self.collectionView 添加到  self.view
//    self.view.backgroundColor = [UIColor redColor];
//    self.collectionView.backgroundColor = [UIColor yellowColor];
    
    // 注册cell
    [self.collectionView registerClass:[QNewFeatureCollectionViewCell  class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // 设置分页
    self.collectionView.pagingEnabled = YES;
    // 禁止弹簧效果
    self.collectionView.bounces = NO;
    // 隐藏滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.page = 0;
    
    // 添加内容
    // 1.添加图片
    // 2.添加到哪里 collectionView
    [self setupAddChildImageView];
}

// 添加所有子控件
- (void)setupAddChildImageView {
    // 1.线
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLine];
    guideLine.x -= 120;
    guideLine.y += 150;
    // 2.球
    UIImageView *guideBall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideBall1"]];
    [self.collectionView addSubview:guideBall];
    self.guideBall = guideBall;
    guideBall.x += 80;
    guideBall.y += 220;
    
    // 3.大标题
    UIImageView *guideBigText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideBigText1"]];
    [self.collectionView addSubview:guideBigText];
    self.guideBigText = guideBigText;
    guideBigText.center = CGPointMake(self.view.width * 0.5, self.view.height * 0.7f);
    // 4.小标题
    UIImageView *guideSmallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.guideSmallText = guideSmallText;
    [self.collectionView addSubview:guideSmallText];
    guideSmallText.center = CGPointMake(self.view.width * 0.5, self.view.height * 0.8f);
}

// 滑动减速时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 总偏移量
    CGFloat offsetX = self.collectionView.contentOffset.x;
    
    // 计算一个偏移量
    CGFloat del = offsetX - self.lastOffsetX;
    
    // 切换图片
    if(del!=0) {
        if(del > 0)
            self.page = offsetX / del;
        else
            self.page = offsetX / (-del);
    }
    
    NSString *ballName = [NSString stringWithFormat:@"guideBall%ld", self.page + 1];
    NSString *bigTextName = [NSString stringWithFormat:@"guideBigText%ld", self.page + 1];
    NSString *smallTextName = [NSString stringWithFormat:@"guideSmallText%ld", self.page + 1];
    UIImage *ballImage = [UIImage imageNamed:ballName];
    self.guideBall.image = ballImage;
    self.guideBigText.image = [UIImage imageNamed:bigTextName];
    self.guideSmallText.image = [UIImage imageNamed:smallTextName];
    
    // 偏移子控件
    self.guideBall.x += del * 2;
    self.guideBigText.x += del * 2;
    self.guideSmallText.x += del * 2;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.guideBall.x -= del;
        self.guideBigText.x -= del;
        self.guideSmallText.x -= del;
    }];
    self.lastOffsetX = offsetX;
}

#pragma mark - CollectionView 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return QPage;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QNewFeatureCollectionViewCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
//    if(cell == nil) {
//        cell = [[UICollectionViewCell alloc] init];
//    }
//    cell.backgroundColor = [UIColor blueColor];
    
    // cell 创建出来就有imageView
    // 创建image
    // 拼接图片名字
    NSString *name = [NSString stringWithFormat:@"gulde%ldBackground", indexPath.item + 1];
    UIImage *image = [UIImage imageNamed:name];
    cell.image = image;
    
    [cell setIndexPath:indexPath count:QPage];
    return cell;
}
@end
