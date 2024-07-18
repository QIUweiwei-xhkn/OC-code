//
//  QNewFeatureCollectionViewCell.m
//  01-彩票
//
//  Created by wei wei on 2024/7/16.
//

#import "QNewFeatureCollectionViewCell.h"
#import "QTabBarViewController.h"

@interface QNewFeatureCollectionViewCell ()
/** 背景图片   */
@property(nonatomic, weak) UIImageView *bgimageView;
/** 立即体验按钮   */
@property(nonatomic, weak) UIButton *startbtn;
@end

@implementation QNewFeatureCollectionViewCell
- (UIButton *)startbtn {
    if(!_startbtn) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn sizeToFit];
        btn.center = CGPointMake(self.width * 0.5, self.height * 0.9f);
        [self.contentView addSubview:btn];
        _startbtn = btn;
        [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startbtn;
}

// 当按钮点击时调用
- (void)btnClick {
//    NSLog(@"%s",__func__);
    // 切换主界面
    // 切换界面方式 1. push 2. tabBarVC 3. modale
    
    // 销毁新特性界面
    // 切换窗口的根控制器
    QTabBarViewController *tabBar = [[QTabBarViewController alloc] init];
    QkeyWindow.rootViewController = tabBar;
    
}

- (UIImageView *)bgimageView {
    if(!_bgimageView) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:imageView];
        _bgimageView = imageView;
    }
    return _bgimageView ;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.bgimageView.image = image;
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count {
    if(indexPath.item == count - 1) {
        // 当是最后一个cell添加立即体验按钮
        self.startbtn.hidden = NO;
    }else {
        // 当是不最后一个cell隐藏立即体验按钮
        self.startbtn.hidden = YES;
    }
}
@end
