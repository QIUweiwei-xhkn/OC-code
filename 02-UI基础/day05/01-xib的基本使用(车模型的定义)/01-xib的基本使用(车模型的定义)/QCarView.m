//
//  QCarView.m
//  01-xib的基本使用(车模型的定义)
//
//  Created by wei wei on 2024/2/1.
//

#import "QCarView.h"

@implementation QCarView
// 子控件初始化
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        // 创建图片UIView对象
        
        // 创建标题对象（UILable）
        
        // 创建子标题对象（UIlable)
        
        // 创建跟帖对象（UIButton)
    }
    return self;
}


// 子控件布局
- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setCar:(QCar *)car {
    _car = car;
    // 设置子控件的数据
    
}
@end
