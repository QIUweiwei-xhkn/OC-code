//
//  ViewController.m
//  04-block内存管理
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"

/*
    Block是不是一个对象： 是对象
    如何判断当前文件是MRC，还是ARC
    1.dealloc 能否调用super，只有MRC才能调用super
    2.能否使用retain,release.如果能用就是MRC
    
    ARC管理原则：只要一个对象没有被强指针修饰就会被销毁，默认局部变量对象都是强指针
    MRC了解开发常识：1.MRC没有strong,weak，局部变量对象就是相当于基本数据类型
                  2.MRC给成员属性赋值，一定要使用set方法，不能直接访问下划线成员属性赋值
 
    总结：只要block没有引用外部局部变量block放在全局区
    MRC：管理block
          只要block引用了外部局部变量，block会放进栈里
          block只能使用copy，不能使用retain，使用retain,block还是在栈里面
    ARC：管理block
         只要block引用外部局部变量，block放在堆里面
         block使用strong.最好不要使用copy
 */

@interface ViewController ()
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) void(^block)(void);
//@property(nonatomic, copy) void(^block)(int);
//@property(nonatomic, retain) NSString *name;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //     int a = 3;
    //    void(^block)(int) = ^ (int a){
    //        NSLog(@"调用block%d", a);
    //    };
    //    self.block = block;
    //    NSLog(@"%@", self.block);
    
    self.name = @"123";
    
    __block int a = 3;
    void(^block)(void) = ^{
        NSLog(@"调用block %d", a);
    };
    _block = block;
    NSLog(@"%@", _block);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    int b = 5;
//    self.block(b);
    _block();
}

//- (void)setName:(NSString *)name {
//    if(name != _name) {
//        [_name release];
//        _name = [name retain];
//    }
//}

//- (void)dealloc
//{
////    self.name = @"123"
////    _name = @"123";
//    [super dealloc];
//}

@end
