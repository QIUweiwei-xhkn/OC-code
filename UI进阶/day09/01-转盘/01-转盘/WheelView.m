//
//  WheelView.m
//  01-转盘
//
//  Created by wei wei on 2024/7/12.
//

#import "WheelView.h"
#import "WheelBtn.h"

@interface WheelView () <CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *contentV;
/** 当前选中按钮   */
@property(nonatomic, weak) UIButton *selectedBtn;
/** <#注释#>   */
@property(nonatomic, strong) CADisplayLink *link;
@end

#define angleToRad(rangle) ((rangle)/180.0 * M_PI)


@implementation WheelView
- (CADisplayLink *)link {
    if(_link == nil) {
        // 添加定时器，一直保持旋转
        CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
        [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        _link = link;
    }
    return _link;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.contentV.userInteractionEnabled = YES;
     // 添加转盘的按钮
    CGFloat btnW = 68;
    CGFloat btnH = 143;
    
    // 加载原始大图片
    UIImage *originImage = [UIImage imageNamed:@"2"];
    // 加载原始选中大图片
    UIImage *originImage2  = [UIImage imageNamed:@"3"];
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat clipW = originImage.size.width / 12.0;
    CGFloat clipH  = originImage.size.height;

    for(int i = 0; i < 12; i++) {
        WheelBtn *btn = [WheelBtn buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, btnW, btnH);
//        btn.backgroundColor = [UIColor redColor];
        // 设置按钮选中状态背景的图片
        [btn setBackgroundImage:[UIImage imageNamed:@"1"] forState:UIControlStateSelected];
        
        // 设置按钮正常状态显示的图片
        // 给定一张图片，截取指定区范围内的图片
        x = i * clipW;
        //CGImageCreateWithImageInRect，使用的坐标都是以像素点，
        //在ios当中使用的都是点坐标，
        CGRect rect = CGRectMake(x, y, clipW, clipH);
        CGImageRef  clipImage = CGImageCreateWithImageInRect(originImage.CGImage, rect);
        [btn setImage:[UIImage imageWithCGImage:clipImage] forState:UIControlStateNormal];
        
        CGImageRef  clipImage2 = CGImageCreateWithImageInRect(originImage2.CGImage, rect);
        [btn setImage:[UIImage imageWithCGImage:clipImage2] forState:UIControlStateSelected];
        
        // 设置按钮状态
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        // 在上一个的基础上每个按钮旋转30度
        btn.transform = CGAffineTransformMakeRotation(angleToRad(i * 30));
        
        // 监听按钮点击
        [btn  addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentV addSubview:btn];
        if(i == 0) {
            [self btnClick:btn];
        }
    }
}

- (void)btnClick:(UIButton *)btn {
    //让当前点击的按钮成为选中状态
    //1.让当前选中的按钮取消选中。
    self.selectedBtn.selected = NO;
    //2.让当前点击的按钮成为选中状态
    btn.selected = YES;
    //3.当前点击的按钮成为选中状
    self.selectedBtn = btn;
}

+(instancetype)wheelView {
    return [[[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil] lastObject];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil] lastObject];
    }
    return self;
}

// 开始旋转
- (void)rotation {
    // 在旋转的时候无法监听事件
//    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.keyPath = @"transform.rotation";
//    anim.toValue = @(M_PI * 3);
//    anim.duration = 1;
//    anim.repeatCount = MAXFLOAT;
//    [self.contentV.layer addAnimation:anim forKey:nil];
    self.link.paused = NO;
    
}

- (void)update {
    self.contentV.transform = CGAffineTransformRotate(self.contentV.transform, M_PI / 30.0);
}

// 停止旋转
- (void)stop {
    self.link.paused = YES;
}

// 开始选号
- (IBAction)startChoose:(id)sender {
    // 让转盘快速旋转几圈
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 4);
    anim.duration = 0.5;
    anim.delegate = self;
    [self.contentV.layer addAnimation:anim forKey:nil];
    // 动画结束时，当前选中的按钮设为指向最上方
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //动画结束时当前选中的按钮指向最上方
    
    //让当前选中的按钮的父控件倒着旋转回去。
    //获取当前选中按钮旋转的角度
    CGAffineTransform transform = self.selectedBtn.transform;
    // 通过tansform 获得当前选中按钮的旋转角度
    CGFloat angle = atan2(transform.b, transform.a);
    
    self.contentV.transform = CGAffineTransformMakeRotation(-angle);
}
@end
