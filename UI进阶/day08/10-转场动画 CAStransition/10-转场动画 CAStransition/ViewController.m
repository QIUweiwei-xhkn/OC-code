//
//  ViewController.m
//  10-转场动画 CAStransition
//
//  Created by wei wei on 2024/7/12.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

static int _i = 0;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 转场代码和转场动画必在同一个方法中
    _i++;
    NSString *str = [NSString stringWithFormat:@"%d", _i % 3];
    self.imageV.image = [UIImage imageNamed:str];
    
    // 添加转场动画
    CATransition *anim = [CATransition animation];
    // 设置转场类型
    /*
     类型宇符串      效果说明                        关键字      方向
     fade          交叉淡化过液                     YES

     push       新视图把旧视图推出去                  YES

     moveIn     新视图移到旧视图上面                  YES

     reveal     将旧视图移开，显示下面的新视图          YES

     cube       立方体翻液效果

     oglFlip    上下左右翻转效果

     suckEffect 收缩效果，如一块布被抽走                           NO
     
     cippleEffect   水滴效果                                    NO
     
     pageCurl      向上翻页效果
     
     pageUnCurl    向下翻页效果
     
     cameraIrisHollowOpen   相机镜头打开效果                      NO
     
     cameraIrisHollowClose  相机镜头关闭效果                      NO
     */
    anim.type = @"pageCurl";
    anim.duration = 1;
    // 设置动画的翻面的起始位置（0～1）
    anim.startProgress = 0.2;
    // 设置动画的翻面的结束位置（0～1）  
    anim.endProgress = 0.5;
    
    [self.imageV.layer addAnimation:anim forKey:nil];
}
@end
