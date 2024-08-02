//
//  ViewController.m
//  03-Runtime(消息机制)
//
//  Created by wei wei on 2024/7/31.
//

#import "ViewController.h"
#import <objc/message.h>
#import "Person.h"

/*
     任何方法调用本质：发送一个消息，用runtime发送消息。
     OC底层实现通过runtime实现验证：方法调用，是否真的是转换为消息机制
 */
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 最终生成消息机制，编译器做的事情
    // 最终代码，需要把当前代码重新编译，用xcode编译器，Clang
    // clang -rewrite-objc main.m 查看最终生成代码
    /*
     需要用到runtime，消息机制
     1.装逼
     2.不得不用runtime消息机制，可以帮我调用私有方法。
     */
    
    /*
     内存5大区
     1.栈 2.堆 3.静态区 4.常量区 5.方法区
     1.栈：不需要手动管理内存，自动管理
     2.堆，需要手动管理内存，自己去释放
     */
    
    Person *p = ((Person *(*)(id, SEL))(void *)objc_msgSend)(objc_getClass("Person"), sel_registerName("alloc"));
    p = ((id (*)(id, SEL))(void *)objc_msgSend)(p, sel_registerName("init"));
    
    [p eat];
    
    ((id (*)(id, SEL))(void *)objc_msgSend)(p, sel_registerName("eat"));
    ((id (*)(id,SEL,NSInteger))(void *)objc_msgSend)(p, @selector(run:), 20);
    
    // 面试：
    // 方法调用流程
    // 怎么去调用eat方法，对象方法：类对象的方法列表 类方法：元类中方法列表
    // 1.通过isa去对应的类中查找
    // 2.注册方法编号
    // 3.根据方法编号去查找对应方法
    // 4.找到只是最终函数实现地址，根据地址去方法区调用对应函数
}

- (void)test {
    // 类方法本质：类对象调用［NSObject class］
     // id：谁发送消息
    // SEL：发送什么消息
//    id objc = [NSObject alloc];
//    id objc = ((NSObject *(*)(id, SEL))(void *)objc_msgSend)([NSObject class], @selector(alloc));
    // xcode6之前，苹果运行使用objc_msgSend.而且有參数提示
    //  xcode6苹果不推荐我们使用runTme
    // 找到build setting --> 搜索msg
    id objc = ((NSObject *(*)(id, SEL))(void *)objc_msgSend)([NSObject class], @selector(alloc));
    
//    objc = [objc init];
    objc = ((id (*)(id, SEL))(void *)objc_msgSend)(objc, @selector(init));
}
@end
