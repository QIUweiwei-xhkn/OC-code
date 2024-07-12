//
//  HandleImageView.m
//  07-画板
//
//  Created by wei wei on 2024/7/11.
//

#import "HandleImageView.h"

@interface HandleImageView () <UIGestureRecognizerDelegate >
/** <#注释#>   */
@property(nonatomic, weak) UIImageView *imageV;
@end

@implementation HandleImageView
- (UIImageView *)imageV {
    if(_imageV == nil) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        imageV.userInteractionEnabled = YES;
        [self addSubview:imageV];
        _imageV = imageV;
        // 添加手势
        [self addGes];
    }
    return _imageV;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageV.image = image; 
}

- (void)addGes {
    // 添加手势
    // 拖动
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.imageV addGestureRecognizer:pan];
    self.imageV.userInteractionEnabled = YES;
    
    // 缩放
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    pinch.delegate = self;
    [self.imageV addGestureRecognizer:pinch];
    
    // 添加旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    [self.imageV addGestureRecognizer:rotation];
    
    // 长按
    UILongPressGestureRecognizer *longP = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longP:)];
    [self.imageV addGestureRecognizer:longP];
}

// 拖动
- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint transP = [pan translationInView:pan.view];
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, transP.x, transP.y);
    // 复位
    [pan setTranslation:CGPointZero inView:pan.view];
}

// 缩放
- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, pinch.scale, pinch.scale);
    [pinch setScale:1];
}

// 旋转
- (void)rotation:(UIRotationGestureRecognizer *)rotation {
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    [rotation setRotation:0];
}

// 长按
- (void)longP:(UILongPressGestureRecognizer *)longP {
    if(longP.state == UIGestureRecognizerStateBegan) {
        // 先让图片闪一下，把图片绘制到画板中
        [UIView animateWithDuration:0.3 animations:^{
            self.imageV.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.3 animations:^{
                self.imageV.alpha = 1;
            } completion:^(BOOL finished) {
                // 把图片绘制到画板中
                UIGraphicsBeginImageContextWithOptions(longP.view.bounds.size, NO, 0);
                CGContextRef ctr = UIGraphicsGetCurrentContext();
                [self.layer renderInContext:ctr];
                
                UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                // 调用代理方法
                if([self.delegate respondsToSelector:@selector(handleImageView:newImage:)]) {
                    [self.delegate handleImageView:self newImage:image];
                }
                [self removeFromSuperview];
                }];
        }];
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
@end
