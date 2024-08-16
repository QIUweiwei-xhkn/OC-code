//
//  QwwLoginRegister.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/14.
//

#import "QwwLoginRegister.h"
@interface QwwLoginRegister ()
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterButton;

@end

@implementation QwwLoginRegister
+ (instancetype)loginView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

+ (instancetype)registerView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    UIImage *image = _loginRegisterButton.currentImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    // 设置按钮背景图片不要拉伸
    [_loginRegisterButton setImage:image forState:UIControlStateNormal];
}
@end
