//
//  ViewController.m
//  06-bounds和frame的简介
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"

/*
     frame：以父控件左上角为原点
     bounds：以自己的左上角为原点，bounds x,y永远为0 ❌
 
     frame和bounds都是用来描述一块区域
     frame：描述可视范围
     bounds：描述可视范围在内容的区域所有的子控件都是相对于内容
     bounds：修改内容原点
 
     相对性：可视范围相对于父控件位置永远不变
            可视范围相对于内容，位置改变
 */

@interface ViewController ()
/** <#注释#>   */
@property(nonatomic, weak) UIView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UISwitch *switchView = [[UISwitch alloc] init];
    [redView addSubview:switchView];
    
    _redView = redView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGRect bounds = _redView.bounds;
    bounds.origin.y -= 10;
    _redView.bounds = bounds;
}


@end
