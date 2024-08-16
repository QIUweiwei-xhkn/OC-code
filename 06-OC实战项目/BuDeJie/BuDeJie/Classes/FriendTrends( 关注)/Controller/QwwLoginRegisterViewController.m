//
//  QwwLoginRegisterViewController.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/13.
//

#import "QwwLoginRegisterViewController.h"
#import "QwwLoginRegister.h"
#import "QwwFastLogin.h"


@interface QwwLoginRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadCons;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation QwwLoginRegisterViewController
// 1.划分结构（顶部， 中部 底部）
// 2.一个结构一个结构
- (void)viewDidLoad {
    [super viewDidLoad];
    /*
        屏幕适配：
        1.一个view从xib中加载，需不需要重新固定尺寸-> 一定要重新设置一下viewWillLayoutSubviews布局子控件
     
        2.在viewDidLoad中加载好不好 -> 不好，开发中一般在
     */
    // 添加到中间的View
    QwwLoginRegister *loginView = [QwwLoginRegister loginView];
    [self.middleView addSubview:loginView];
    
    // 添加到中间的View
    QwwLoginRegister *registerView = [QwwLoginRegister registerView];
    [self.middleView addSubview:registerView];
    
    // 添加底部的view
    QwwFastLogin *fastLoginView = [QwwFastLogin fastLogin];
    [self.bottomView addSubview:fastLoginView];
    

}

- (void)viewWillLayoutSubviews {
    // 一定要调用super
    [super viewWillLayoutSubviews];
    
    QwwLoginRegister *loginView = _middleView.subviews[0];
    loginView.frame = CGRectMake(0, 0, _middleView.qww_width * 0.5, _middleView.qww_height);
    
    QwwLoginRegister *registerView = _middleView.subviews[1];
    registerView.frame = CGRectMake(_middleView.qww_width * 0.5, 0, _middleView.qww_width * 0.5, _middleView.qww_height);
    
    QwwFastLogin *fastLoginView = _bottomView.subviews.firstObject;
    fastLoginView.frame = _bottomView.bounds;

}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)clickRegister:(UIButton *)sender {
    sender.selected = !sender.selected;
    _leadCons.constant = _leadCons.constant == 0? -self.middleView.qww_width * 0.5 :0;
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}
@end
