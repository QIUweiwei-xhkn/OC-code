//
//  ClockView.m
//  06-手势解锁
//
//  Created by wei wei on 2024/7/10.
//

#import "ClockView.h"
@interface ClockView ()
/** 保存已选中的按钮   */
@property(nonatomic, strong) NSMutableArray *selectBtnsArray ;
// 获得当前手指所在点
@property(nonatomic, assign) CGPoint curP;
@end

@implementation ClockView
- (NSMutableArray *)selectBtnsArray {
    if(_selectBtnsArray == nil) {
        _selectBtnsArray = [NSMutableArray array];
    }
    return _selectBtnsArray ;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // 为搭建界面添加按钮
    [self setUp];
}

// 搭建界面添加按钮
- (void)setUp {
    for(int i = 0; i < 9; i++) {
        // 创建按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled = NO;
        btn.tag = i;
         
        // 设置按钮图片
        [btn setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        // 设置选中状态的 按钮图片
        [btn setImage:[UIImage imageNamed:@"2"] forState:UIControlStateSelected];
        [self addSubview:btn];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 取出每一个按钮，设置frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat btnWH = 67;
    
    int column = 3;
    CGFloat margin = (self.bounds.size.width - (btnWH * column)) / (column + 1);
    int curC = 0;
    int curR = 0;
    
    for(int i = 0; i < self.subviews.count; i++) {
        // 当前所在列
        curC = i % column;
        // 当前所在行
        curR = i / column;
        
        x = margin + (margin + btnWH) * curC;
        y = margin + (margin + btnWH) * curR;
        
        // 取出每一个按钮
        UIButton *btn = self.subviews[i];
        // 设置按钮的frame
        btn.frame = CGRectMake(x, y, btnWH, btnWH);
    }
}

// 获得当前手指所在点
- (CGPoint)getCurrentPoint:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    return [touch locationInView:self];
}

// 给定一个点判断该点是否在按钮上
// 若不在返回nil
- (UIButton *)btnRectContainsPoint:(CGPoint)point {
    for(UIButton *btn in self.subviews) {
        if(CGRectContainsPoint(btn .frame, point)) {
            return btn;
        }
    }
    return nil;
}

// 手指开始点击调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 当前的手指所在的点在不在按钮上，如果在，让按纽成为选中状态
    // 1.获取当前手指所在的点
//    UITouch *touch = [touches anyObject];
//    CGPoint curP = [touch locationInView:self];
    CGPoint curP = [self getCurrentPoint:touches];
    // 2.判断curP在不在按钮身上
    // 取出所有的按钮进行判断
//    for(UIButton *btn in self.subviews) {
//        if(CGRectContainsPoint(btn .frame, curP)) {
//            // 让当前按钮状态为选中
//            btn.selected = YES;
//            NSLog(@"%s",__func__);
//        }
//    }
    UIButton *btn = [self btnRectContainsPoint:curP];
    if(btn  && btn.selected == NO) {
        btn.selected = YES;
        // 保存当前选中按钮
        [self.selectBtnsArray addObject:btn];
    }
}

// 手指移动时调用
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint curP = [self getCurrentPoint:touches];
    // 记录当前手指所在的点
    self.curP = curP;
    UIButton *btn = [self btnRectContainsPoint:curP];
    if(btn && btn.selected == NO) {
        btn.selected = YES;
        // 保存当前选中按钮
        [self.selectBtnsArray addObject:btn];
    }
    // 重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if(self.selectBtnsArray.count > 0) {
        // 1.创建路径
        UIBezierPath *path = [UIBezierPath bezierPath];
        // 2.取出所有的选中按钮
        for(int i = 0; i < self.selectBtnsArray.count; i++) {
            // 取出每一个按钮
            UIButton *btn = self.selectBtnsArray[i];
            // 判断当前按钮是否是第一个按钮 是的话设为起点，不是的话添加线到该按钮
            if(i == 0) {
                [path moveToPoint:btn.center];
            }else {
                [path addLineToPoint:btn.center];
            }
        }
        // 再添加一根线到手指
        [path addLineToPoint:self.curP];
        
        // 设置路径的状态
        [path setLineWidth:10];
        [[UIColor redColor] set];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path stroke];
    }
}
 
// 手指离开时调用
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSMutableString *str = [NSMutableString string];
    // 1.取消所有按钮的选中
    for(int i = 0; i < self.selectBtnsArray.count; i++) {
        UIButton *btn = self.selectBtnsArray[i];
        btn.selected = NO;
        [str appendFormat:@"%ld", btn.tag];
    }
    // 2.清空路径
    [self.selectBtnsArray removeAllObjects];
    [self setNeedsDisplay];
    // 3.查看当前选中按钮顺序
    NSLog(@"%@",str);
}
@end
