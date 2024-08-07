//
//  FlowLayout.m
//  09-自定义流水布局
//
//  Created by wei wei on 2024/8/6.
//

#import "FlowLayout.h"
/*
    自定义布局，只要了解这5种方法
 - (void)prepareLayout;
 
 - (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect;
 
 - (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;

 - (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity;
 
 - (CGSize)collectionViewContentSize;

 */
@implementation FlowLayout

// 重写方法，扩展它的功能

// 什么什么时候调用：collectionView第一次布局，collectionView刷新的时候也会调用
// 作用：计算cell的布局，条件：cell的位置是固定不变的
- (void)prepareLayout {
    [super prepareLayout];
//    NSLog(@"%s",__func__);
}

// 计算collectionView的滚动范围
//- (CGSize)collectionViewContentSize {
//    return [super collectionViewContentSize];
//}

/*
     UICollectionviewLayoutAttributes：确定cell的尺寸
     一个UICollectionViewLayoutAttributes对象就对应一个cell
     拿到UICollectionViewLayoutAttributes相当于拿到cell
 */
// 作用：指定一段区域给你这段区域内cell的尺寸
// 可以一次性返回所有cell尺寸，也可以每隔一个距离返回cell
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 获得当前的现实cell的布局
    NSArray *attrs = [super layoutAttributesForElementsInRect:self.collectionView.bounds];
    
    // 设置cell尺寸 => UICollectionViewLayoutAttributes
    // 越靠近中心点，距离越小，缩放越大
    // 求cell与中心点距离
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        // 2.计算算中心点的距离
        CGFloat distance = fabs(attr.center.x - self.collectionView.contentOffset.x - self.collectionView.bounds.size.width * 0.5);
        CGFloat scale = 1 - distance / (self.collectionView.bounds.size.width * 0.5) * 0.25;
        attr.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
//    NSArray *attrs = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, MAXFLOAT, MAXFLOAT)];
//    NSLog(@"%s",__func__);
//    NSLog(@"%@", attrs);
//    int i = 0;
//    for (UICollectionViewLayoutAttributes *attr in attrs) {
//        if(i == 0) {
//            attr.transform = CGAffineTransformMakeScale(0.5, 0.5);
//        }
//        i++;
//    }
    return attrs;
}

// Invalidate:刷新
// 在滚动时是否允许刷新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

// 什么时候调用：用户手指一松开是会调用
// 作用：确定最终的偏移量
// 定位：距离中心点越近，这个cell最终展示到中心点
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
//    NSLog(@"%s",__func__);
    // 拖动较快时 最终偏移量 不等于 手指离开时的偏移量
    // 最终偏移量
    CGPoint transP =  [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
    
    CGFloat collectionW = self.collectionView.bounds.size.width;
     
    // 0.获取最终显示的区域
    CGRect rect = CGRectMake(transP.x, 0, collectionW, MAXFLOAT);
    NSLog(@"%f", transP.x);
    
    CGFloat minDis = MAXFLOAT;
    NSArray *attrs = [super layoutAttributesForElementsInRect:rect];
    
    for (UICollectionViewLayoutAttributes *attr in attrs) {
        // 获得距离中心点的距离
        CGFloat distance = attr.center.x - self.collectionView.contentOffset.x - self.collectionView.bounds.size.width * 0.5;
        if(fabs(distance) < fabs(minDis)) {
            minDis = distance;
        }
        if(transP.x < 0) {
            transP.x = 0;
        }
    }
    transP.x += minDis;
    
    NSLog(@"%f", transP.x);
    
    // 获得collectionView偏移量
    NSLog(@"%@, %@", NSStringFromCGPoint(transP), NSStringFromCGPoint(self.collectionView.contentOffset));
    return transP;
}
@end
