//
//  UIImage+image.m
//  04-Runtime（交换方法）
//
//  Created by wei wei on 2024/7/31.
//

#import "UIImage+image.h"
#import <objc/message.h>

@implementation UIImage (image)
// 把类加载进内存的时候调用，只会调用一次
+ (void) load {
    // 获取imageNamed
    // 获取哪个类的方法
    // SEL：获取哪个方法
    // 获取imageNamed
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    // 获取qww_imageNamed
    Method qww_imageNamedMethod = class_getClassMethod(self, @selector(qww_imageNamed:));
    // 交互方法：runtime
    method_exchangeImplementations(imageNamedMethod, qww_imageNamedMethod);
}
// 会调用多次 swift
//+ (void)initialize {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        <#code to be executed once#>
//    });
//}


// 在分类中，最好不要重写系统方法，一旦重写，把系统方法实现给干掉
//+ (UIImage *)imageNamed:(NSString *)name {
//    super --> 父类  NSObject 
//}

// 1.加载图片
// 2.是否加载成功
+ (UIImage *)qww_imageNamed:(NSString *)name {
    // 真正加载图片
    UIImage *image = [UIImage qww_imageNamed:name];
    
    if(image == nil) {
        NSLog(@"加载图片失败");
    }else {
        NSLog(@"加载图片成功");
    }
    return image;
}
@end
