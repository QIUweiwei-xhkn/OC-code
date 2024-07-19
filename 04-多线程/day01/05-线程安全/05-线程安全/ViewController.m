//
//  ViewController.m
//  05-线程安全
//
//  Created by wei wei on 2024/7/18.
//

#import "ViewController.h"

@interface ViewController ()
/** 售票员A   */
@property(nonatomic, strong) NSThread *threadA;
/** 售票员B  */
@property(nonatomic, strong) NSThread *threadB;
/** 售票员C   */
@property(nonatomic, strong) NSThread *threadC;
/** 总票数   */
@property(nonatomic, assign) NSInteger totalTicket;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.totalTicket = 100;
    self.threadA = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadA.name =  @"售票员A";
    self.threadA.threadPriority = 0.4;
    [self.threadA start];
    
    self.threadB = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadB.name =  @"售票员B";
    self.threadB.threadPriority = 0.9;
    [self.threadB start];
    
    self.threadC = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadC.name =  @"售票员C";
    self.threadC.threadPriority = 0.9;
    [self.threadC start];
}

- (void)saleTicket {
    while (1) {
        // <#token#> 锁，必须是全局唯一的
        // 锁定一份代码只需要一把锁，多把锁是无效的
        // 1.注意加锁的位置
        // 2.加锁的前提条件，多线程共享同一资源
        // 3.加锁是有代价的，会消耗性能
        // 4.加锁的结果：线程同步
        
        // •互斥锁的优缺点
        // 口优点：能有效防止因多线程抢夺资源造成的数据安全问题
        //  口缺点：需要消耗大量的CPU资源
        
        @synchronized (self) {
            NSInteger count = self.totalTicket;
            if(count > 0) {
                // 还有票
                self.totalTicket = count - 1;
                for(int i = 0; i < 1000000; i++){}
                NSLog(@"%@卖出去一张票，还剩%zd张票", [NSThread currentThread].name, self.totalTicket);
                if([NSThread currentThread].threadPriority > 0.5) {
                    [NSThread currentThread].threadPriority -= 0.1;
                }
            }else {
                NSLog(@"%@票卖完啦，下班回家", [NSThread currentThread].name);
                break;
            }
        }
    }
}
@end
