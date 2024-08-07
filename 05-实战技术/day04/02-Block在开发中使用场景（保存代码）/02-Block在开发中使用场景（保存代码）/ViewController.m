//
//  ViewController.m
//  02-Block在开发中使用场景（保存代码）
//
//  Created by wei wei on 2024/8/6.
//

#import "ViewController.h"
// BlockType：类型别名
typedef void(^BlockType)(void);

@interface ViewController ()
/** block如何声明，就如何定义成属性   */
@property(nonatomic, strong) void(^block)(void); // 建议使用这个

//@property(nonatomic, strong) BlockType block;
@end

@implementation ViewController

// 在一个方法中定义，在另一个方法中调用
// 在一个类中定义，在另一个类中调用
- (void)viewDidLoad {
    [super viewDidLoad];
    // void(^)()
    void(^block)(void) = ^ {
        NSLog(@"调用了block块");
    };
    _block = block;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _block();
}

@end
