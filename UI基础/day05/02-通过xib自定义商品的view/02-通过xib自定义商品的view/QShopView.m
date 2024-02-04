//
//  QShopView.m
//  02-通过xib自定义商品的view
//
//  Created by wei wei on 2024/2/4.
//

/**
 *  xib使用注意事项
 *  1. 如果一个view从xib中加载，就不能用[[xxx alloc] init] 和 [[xxx alloc] initWithFrame：]创建
 *  2.如果一个xib被经常使用，就应该提供快速构造方法
 *  3.如果一个view从xib加载：
 *   用代码添加一些子控件，得在 initWithCoder：和 awakeFromNib 创建
 *  4.如果一个view从xib加载：会调用initWithCoderr：和 awakeFromNib ，不会调用init 和 initWithFrame：方法
 *
 */

#import "QShopView.h"
@interface QShopView ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

/** 测试 lable   */
@property(nonatomic, weak) UILabel *lable;
/** 毛玻璃   */
@property(nonatomic, weak) UIToolbar *toolbar;
@end

@implementation QShopView
/*
 -(instancetype)init {
     if(self = [super init]) {
         NSLog(@"%s",__func__);
     }
     return self;
 }

 - (instancetype)initWithFrame:(CGRect)frame {
     if(self = [super initWithFrame:frame]) {
         NSLog(@"%s",__func__);
     }
     return self;
 }
 */

/**
 *  如果View从xib中加载，就回调用initWithCoder：方法
 *  创建子控件……
 *   注意：如果子控件是从xib中创建，是出于未唤醒状态
 *
 */

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        /*
         UILabel *lable = [[UILabel alloc] init];
         lable.backgroundColor = [UIColor redColor];
         lable.text = @"hhhhh";
         [self addSubview:lable];
         self.lable = lable;
         */
        
//        // 往imageView上加毛玻璃
//        UIToolbar *toolbar = [[UIToolbar alloc] init];
//        [self.iconView addSubview:toolbar];
//        self.toolbar = toolbar;
    }
    return self;
}

/**
 *  从xib中唤醒
 *  添加xib中创建的子控件的 子控件
 *
 */
- (void)awakeFromNib {
    [super awakeFromNib];
    // 往imageView上加毛玻璃
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [self.iconView addSubview:toolbar];
    self.toolbar = toolbar;
}

#pragma mark - 快速构造方法
+ (instancetype)shopView {
    return [[[NSBundle mainBundle] loadNibNamed:@"QShopView" owner:nil options:nil] firstObject];
}


#pragma mark - 布置子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.lable.frame = self.bounds;
    self.toolbar.frame = self.iconView.bounds;
}

#pragma mark - 设置数据
- (void)setIcon:(NSString *)icon {
    self.iconView.image = [UIImage imageNamed:icon];
}

- (void)setName:(NSString *)name {
    self.titleLable.text = name;
}
@end


