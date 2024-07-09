//
//  dragViewController.m
//  08-抽屉效果
//
//  Created by wei wei on 2024/7/8.
//

#import "dragViewController.h"

@interface dragViewController ()
/** <#注释#>   */
@end

@implementation dragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控件
    [self setUp];
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [_mainV addGestureRecognizer:pan];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.view addGestureRecognizer:tap];
}

#define screenW [UIScreen mainScreen].bounds.size.width
#define targetL -275
#define targetR 275
// 添加手势函数
- (void)tap {
    [UIView animateWithDuration:0.5 animations:^{
        self->_mainV.frame = [UIScreen mainScreen].bounds;
    }];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    //  求偏移量
    // 获得偏移量
    CGPoint transP = [pan translationInView:_mainV];
    // 不可以用CGAffineTransformTranslate，因为还要修改高度，而CGAffineTransformTranslate只能修改x,y
//    _mainV.transform = CGAffineTransformTranslate(_mainV.transform, transP.x, 0);
    _mainV.frame = [self frameWithOffsetX:transP.x];
    
     // 判断拖动方向
    if(_mainV.frame.origin.x > 0) {
        // 向右移
        _rightV.hidden = YES;
    }else if(_mainV.frame.origin.x < 0) {
        // 向左移
        _rightV.hidden = NO;
    }
    
    // 当手指松开时，做自动定位
    CGFloat target = 0;
    if(pan.state == UIGestureRecognizerStateEnded) {
        if(_mainV.frame.origin.x > screenW * 0.5) {
//            // 1.判断在右侧
//            // 当前View的x有没有大于屏幕宽度的一半，大于就是在右侧
            target = targetR;
        }else if(CGRectGetMaxX(_mainV.frame) < screenW * 0.5) {
//            //2.判断在左侧
//            // 当前View的最大的x有没有小于解幕宽度的一半，小于就是在左侧
            target = targetL ;
        }
        // 计算当前mainV的frame
        CGFloat offsetX = target - _mainV.frame.origin.x;
        [UIView animateWithDuration:0.5 animations:^{
            self->_mainV.frame = [self frameWithOffsetX:offsetX];
        }];
    }
    // 复位
    [pan setTranslation:CGPointZero inView:_mainV];
}


#define maxY 100
// 根据偏移量计算的mainV的Frame
- (CGRect)frameWithOffsetX:(CGFloat)offsetX {
    CGRect frame = _mainV.frame;
    frame.origin.x += offsetX;
    
    //当拖动的View的x值等于屏幕宽度时，maxY为最大，最大为100
    // 375（offsetX） * 100(最大y的高度) / 375（mainV的宽度） = 100
    // 对计算结果取绝对值
    CGFloat y = fabs(frame.origin.x * maxY / [UIScreen mainScreen].bounds.size.width);
    frame.origin.y = y;
    
    frame.size.height = [UIScreen mainScreen].bounds.size.height - 2 * y;
    return frame;
}

- (void)setUp {
    // leftV
    UIView *leftV = [[UIView alloc] initWithFrame:self.view.bounds];
    leftV.backgroundColor = [UIColor blueColor];
    _leftV = leftV;
    [self.view addSubview:leftV];
    // rightV
    UIView *rightV = [[UIView alloc] initWithFrame:self.view.bounds];
    rightV.backgroundColor = [UIColor greenColor];
    _rightV = rightV;
    [self.view addSubview:rightV];
    // mainV
    UIView *mainV = [[UIView alloc] initWithFrame:self.view.bounds];
    mainV.backgroundColor = [UIColor redColor];
    _mainV = mainV;
    [self.view addSubview:mainV];
}
@end
