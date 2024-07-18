//
//  main.m
//  02-第一个OC类
//
//  Created by wei wei on 2023/9/10.
//

#import <Foundation/Foundation.h>

// 类的声明 注意：类名首个字母必须大写
// 属性名前最好加_
@interface Iphone : NSObject {
    // 注意： 默认情况下，OC对象的属性不能直接访问
    @public // 让类的属性公开，这样就可以直接通过一个指向结构体的指针来操作对象的属性
    float _modle;
    int _cpu;
    int _color;
}

// 行为
@end

@implementation Iphone
// 行为的实现
@end

int main(int argc, const char * argv[]) {
    // 在OC中想通过一个类来创建一个对象，必须给这个对象发送一个消息（好比C语言中的调用方法）
    // 发消息：写上[类名词/对象名称 方法名称];
    Iphone *p = [Iphone new];
    p->_color = 0;
    p->_cpu = 0;
    p->_modle = 4;
    NSLog(@"modle = %f, cpu = %d, color = %d", p->_modle, p->_cpu, p->_color);
    return 0;
}
