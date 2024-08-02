//
//  Qimage.m
//  04-Runtime（交换方法）
//
//  Created by wei wei on 2024/7/31.
//

#import "Qimage.h"

@implementation Qimage
+ (UIImage *)imageNamed:(NSString *)name {
    // 真正加载图片
    UIImage *image = [super imageNamed:name];
    
    if(image == nil) {
        NSLog(@"加载图片失败");
    }else {
        NSLog(@"加载图片成功");
    }
    return image;
}
@end
