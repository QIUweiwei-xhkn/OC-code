//
//  main.m
//  03-第一个OC方法
//
//  Created by wei wei on 2023/9/10.
//

#import <Foundation/Foundation.h>
// 类的声明
@interface Iphone : NSObject {
    @public
    float _modle;
    int _cpu;
    int _color;
}

// 行为
// 与C语言中定义函数一样，声明在 interface 中，实现在 implementaion 中
// 注意： OC中没有参数可以不用写（），因为在OC中（）有特殊作用，OC中的（）是用来扩住数据类型的
// OC中的方法分为了两种，类方法 和 对象方法
// OC中类方法用+比表示，对象方法用-比表示
- (void)about;
- (char *)loadmassage;
// 注意：如果OC方法中有形参，那么每个参数的数据类型前必须加上一个：
// 注意：当前的方法名称是 signal: 冒号也是方法名称的一部分
- (int)signal:(int)number;
- (int)sendmassage:(int)number:(char *)content;
@end

// 类的实现
@implementation Iphone
// 行为的实现
- (void)about {
    NSLog(@"打印本机信息");
    NSLog(@"modle = %f, cpu = %d, color = %d", _modle, _cpu, _color);
}

- (char *)loadmassage {
    return "你好中文输出也挺好";
}

- (int)signal:(int)number {
    NSLog(@"打电话给%d", number);
    return 1;
}
- (int)sendmassage:(int)number:(char *)content{
    NSLog(@"给%d发%s",number, content);
    // 注意：OC中的NSLog对C语言的字符串支持不是很好，如果返回的是中文的C语言字符串，可能输出乱码或者什么都不输出
    return 1;
}
@end
int main(int argc, const char * argv[]) {
    Iphone *p = [Iphone new];
    p->_color = 0;
    p->_cpu = 0;
    p->_modle = 4;
    [p about];
    char *content = [p loadmassage];
    NSLog(@"content = %s",content);
    [p signal:12345];
    [p sendmassage:1230 : "woxiangni"];
    return 0;
}
