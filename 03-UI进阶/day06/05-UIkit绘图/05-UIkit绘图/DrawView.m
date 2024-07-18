//
//  DrawView.m
//  05-UIKit绘图
//
//  Created by wei wei on 2024/7/9.
//

#import "DrawView.h"

@implementation DrawView
- (void)drawRect:(CGRect)rect {
   // 画图片
//    UIImage *image = [UIImage imageNamed:@"2"];
    // drawAtPoint 绘制的是原始图片的大小
//    [image drawAtPoint:CGPointZero];
    
    // 会把要绘制的图片填充得到给定的区域中
//    [image drawInRect:rect];
    
    // 裁剪(超过裁剪区域的内容会被自动裁剪掉)
    //  设置裁剪区域一定要在绘制之前进行设置
//    UIRectClip(CGRectMake(0, 0, 50, 50));
    
    // 平铺
//    [image drawAsPatternInRect:self.bounds];
    
    UIRectFill(CGRectMake(50, 50, 50, 50));
}

// 画文字
- (void)drawText {
    NSString *str = @"没什么大愿望";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    // 字体大小
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:50];
    // 设置颜色
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    // 设置描边
    dict[NSStrokeColorAttributeName] = [UIColor greenColor];
    dict[NSStrokeWidthAttributeName] = @2;
    // 设置阴影
    NSShadow *shaw = [[NSShadow alloc] init];
    shaw.shadowColor = [UIColor blueColor];
    // 设置阴影偏移量
    shaw.shadowOffset = CGSizeMake(10, 10);
    // 设置阴影模糊
    shaw.shadowBlurRadius = 3.0;
    dict[NSShadowAttributeName] = shaw;
    
//    [str drawAtPoint:CGPointZero withAttributes:dict];  // 文字超出view的宽度都不会自动换行
//    [str drawInRect:rect withAttributes:dict]; // 文字超出view的宽度会自动换行
}
@end
