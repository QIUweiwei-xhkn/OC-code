//
//  ViewController.m
//  属性的引用
//
//  Created by wei wei on 2024/8/21.
//

#import "ViewController.h"
#import "QwwCat.h"

/*
 1. weak
 1> OC对象
 
 2. assign
 1> 基本数据类型
 2> OC对象
 
 3. strong
 1> OC对象
 
 4. copy
 1> NSString *
 2> block
 
 5.使用weak和assign修饰OC对象的区别
 1＞成员变量
 1） weak生成的成员变量是用__weak修饰的，比如 QwwCat *__weak _cat;
 2)  assignErAsS@###__unsafe_unretained 修饰的 QwwCat * __unsafe_unretained _cat;
 
 2> __weak和__unsafe_unretained
 1） 都不是强指针（不是强引用），不能保住对象的命
 2)  __weak：所指向的对象销毁后，会自动变成nil指针（空指针），不再指向已经销毁的对象
 3） __unsafe_unretained ：所指向的对象销毁后，仍旧指向已经销毁的对象
 */

@interface ViewController ()
//@property(nonatomic, strong) QwwCat *cat;
//@property(nonatomic, weak) QwwCat *cat;     // QwwCat *__weak _cat;
@property(nonatomic, assign) QwwCat *cat;   // QwwCat * __unsafe_unretained _cat;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.cat = [[QwwCat alloc] init];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", self.cat);
}
@end
