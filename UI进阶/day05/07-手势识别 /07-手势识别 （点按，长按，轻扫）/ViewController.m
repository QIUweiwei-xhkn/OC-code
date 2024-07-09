//
//  ViewController.m
//  07-手势识别 （点按，长按，轻扫）
//
//  Created by wei wei on 2024/7/8.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.创建手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    // 2.添加手势
    [self.imageV addGestureRecognizer:rotation];
    
    // 1.创建手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    // 2.添加手势
    [self.imageV addGestureRecognizer:pinch];
    
   
}

// 3.实现手势方法
// 点按
-(void)tap {
    NSLog(@"%s",__func__);
}

// 长按
-(void)longP:(UIGestureRecognizer *)longP {
    NSLog(@"%s",__func__);
    // 判断手势状态
    if(longP.state == UIGestureRecognizerStateBegan) {
        NSLog(@"开始长按");
    }else if (longP.state == UIGestureRecognizerStateChanged) {
        NSLog(@"长按开始移动");
    }else if(longP.state == UIGestureRecognizerStateEnded) {
        NSLog(@"手指离开，长按结束");
    }
    
}

// 轻扫
- (void)swipe:(UISwipeGestureRecognizer *)swipe {
    NSLog(@"%s",__func__);
    if(swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"lefe");
    }else if(swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"right");
    }
}

// 拖动
-(void)pan:(UIPanGestureRecognizer *)pan {
    NSLog(@"%s",__func__);
    // 获得偏移量
    CGPoint transP = [pan translationInView:self.imageV];
//    NSLog(@"%@",NSStringFromCGPoint(transP));
    self.imageV.transform = CGAffineTransformTranslate(self.imageV.transform, transP.x, transP.y);
    // 让它相对于上一次
    [pan setTranslation:CGPointZero inView:self.imageV];
}

// 缩放（捏合）
- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    NSLog(@"%s",__func__);
    self.imageV.transform = CGAffineTransformScale(self.imageV.transform, pinch.scale, pinch.scale);
    pinch.delegate = self;
    // 复位
    [pinch setScale:1];
}

// 旋转
-(void)rotation:(UIRotationGestureRecognizer *)rotation {
    NSLog(@"%s",__func__);
    self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, rotation.rotation);
    rotation.delegate = self;
    // 复位
    [rotation setRotation:0];
    
}

#pragma mark - UIGestureRecognizerDelegate
// 是否允许接收手指
//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    // 让当前图片左边可以点击，右边不可以点击
//    CGPoint curP = [touch locationInView:self.imageV];
//    if(curP.x > self.imageV.frame.size.width * 0.5) {
//        // 右边
//        return NO;
//    }else {
//        // 左边
//        return YES;
//    }
//}

// 一个控件可以添加多个手势,混合手势
// Simultaneous：同时
//  是否允许同时支持多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

/* -------------------------------------------------------- */
// 点按，敲击
- (void)set1 {
    // 1.创建手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    // 2.添加手势
    [self.imageV addGestureRecognizer:tap];
}

// 长按
- (void)set2 {
    // 1.创建手势
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    // 2.添加手势
    [self.imageV addGestureRecognizer:longP];
}

// 轻扫
- (void)set3 {
    // 注意：一个UISwipeGestureRecognizer手势只有一个方向
    // 1.创建手势
    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
//    swipe.direction = UISwipeGestureRecognizerDirectionLeft; // 向左边轻扫
    swipe1.direction = UISwipeGestureRecognizerDirectionRight; // 向右边轻扫，默认
    
    UISwipeGestureRecognizer *swipe2 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipe2.direction = UISwipeGestureRecognizerDirectionLeft; // 向左边轻扫
    // 2.添加手势
    [self.imageV addGestureRecognizer:swipe1];
    [self.imageV addGestureRecognizer:swipe2];
}

// 拖动
- (void)set4 {
    // 1.创建手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    // 2.添加手势
    [self.imageV addGestureRecognizer:pan];
}

// 缩放（捏合）
- (void)set5 {
    // 1.创建手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    // 2.添加手势
    [self.imageV addGestureRecognizer:pinch];
}

// 旋转
- (void)set6 {
    // 1.创建手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    // 2.添加手势
    [self.imageV addGestureRecognizer:rotation];
}
@end
