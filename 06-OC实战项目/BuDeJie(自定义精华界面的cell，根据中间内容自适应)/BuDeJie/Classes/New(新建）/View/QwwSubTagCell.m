//
//  QwwSubTagCell.m
//  BuDeJie
//
//  Created by wei wei on 2024/8/12.
//

#import "QwwSubTagCell.h"
#import "QwwSubTagItem.h"

@interface QwwSubTagCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *numLable;

@end
/*
 头像变成圆角 1.设置头像圆角 2.裁剪图片(生成新的图片 -》 图形上下文才能够生成新的大图片)
 处理数字
 */
@implementation QwwSubTagCell
- (void)setFrame:(CGRect)frame {
    frame.size.height -= 1;
    // 真正给cell赋值
    [super setFrame:frame];
}

- (void)setSubTagItem:(QwwSubTagItem *)subTagItem {
    _subTagItem = subTagItem;
    // 设置内容
    _nameLable.text = subTagItem.theme_name;
    
    [self resolveNum];
    
    // 设置头像
    [_iconImageView qww_setHeader:subTagItem.image_list];
    
//    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:subTagItem.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] options:0 completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        // 1.开启图形上下文
//        // 第三个参数：比例参数：当前点和和像素的比例
//        UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
//        // 2.描述裁剪区域
//        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
//        // 3.设置裁剪区域
//        [path addClip];
//        // 4.画图片
//        [image drawAtPoint:CGPointZero];
//        // 5.取出图片
//        image = UIGraphicsGetImageFromCurrentImageContext();
//        // 6.关闭上下文
//        UIGraphicsEndImageContext();
//        
//        self.iconImageView.image = image;
//    }];
    
}

// 处理数字
- (void)resolveNum {
    // 判断是否大于10000
    NSString *numStr = [NSString stringWithFormat:@"%@人订阅", _subTagItem.sub_number];
    NSInteger num = _subTagItem.sub_number.integerValue;
    if(num > 10000) {
        CGFloat Fnum = num / 10000.0;
        numStr = [NSString stringWithFormat:@"%.1f人订阅", Fnum];
        numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    _numLable.text = numStr;
}

- (IBAction)dingyueClick:(id)sender {
}

// 从xib中加载就会调用一次
- (void)awakeFromNib {
    [super awakeFromNib];
    // 设置头像圆角
    _iconImageView.layer.cornerRadius = _iconImageView.qww_width * 0.5;
    _iconImageView.layer.masksToBounds = YES; 
    self.separatorInset = UIEdgeInsetsZero;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
