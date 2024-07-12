//
//  DrawView.m
//  07-画板
//
//  Created by wei wei on 2024/7/10.
//

#import "DrawView.h"
#import "MyBezierPath.h"

@interface DrawView ()
/** 当前绘制的路径   */
@property(nonatomic, strong) UIBezierPath *path;

/** 保存当前所有的路径   */
@property(nonatomic, strong) NSMutableArray *allPathArray;
/** 线的宽度   */
@property(nonatomic, assign) CGFloat width;

/** 线的颜色   */
@property(nonatomic, strong) UIColor *color;


@end

@implementation DrawView
- (void)setImage:(UIImage *)image {
    _image = image;
    // 添加到数组中
    [self.allPathArray addObject:image];
    // 重绘
    [self setNeedsDisplay];
}

- (NSMutableArray *)allPathArray {
    if(_allPathArray == nil) {
        _allPathArray = [NSMutableArray array];
    }
    return _allPathArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    self.width = 1;
    self.color = [UIColor blackColor];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    // 获得当前手指的位置
    CGPoint curP = [pan locationInView:self];
    // 判断手势的状态
    if(pan.state == UIGestureRecognizerStateBegan) {
        // 什么情况下自定义类：当发现系统原始的功能，没有办法瞒足自己需求时，这个时候，要自定义类。继承系统原来的东西.再去添加属性自己的东西，
//        UIBezierPath *path = [UIBezierPath bezierPath];
        MyBezierPath *path = [[MyBezierPath alloc] init];
        self.path = path;
        // 设置起点
        [self.path moveToPoint:curP];
        // 设置线宽
        [self.path setLineWidth:self.width];
        // 设置线的颜色
        path.color = self.color;
        [self.allPathArray addObject:path];
    }else if(pan.state == UIGestureRecognizerStateChanged) {
        [self.path addLineToPoint:curP];
    }
    // 重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    for(MyBezierPath *path in self.allPathArray) {
        // 取出真实的数据类型
        if([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
            [image drawInRect:rect];
        }else {
            [path.color set];
            [path stroke];
        }
        
    }
}

// 清屏
- (void)clear {
    // 清空所有路径
    [self.allPathArray removeAllObjects];
    // 重绘
    [self setNeedsDisplay];
}

// 撤销
- (void)undo {
    // 删除最后一条路径
    [self.allPathArray removeLastObject];
    // 重绘
    [self setNeedsDisplay];
}

// 橡皮擦
- (void)erase {
    [self setLineColor:[UIColor whiteColor]];
}

// 设置线的宽度
- (void)setLineWidth:(CGFloat)lineWidth {
    self.width = lineWidth;
}
//// 设置线的颜色
- (void)setLineColor:(UIColor *)color {
    self.color = color;
}


@end
