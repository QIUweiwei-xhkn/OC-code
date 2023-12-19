//
//  Baby.m
//  04-protocol应用场景2-代理设计模式
//
//  Created by wei wei on 2023/10/29.
//

#import "Baby.h"
#import "Nanny.h"
#import "Student.h"

@implementation Baby


- (void)food
{
    self.hungry += 5;
    NSLog(@"要吃东西 %i", self.hungry);
    // 通知保姆
    if ([self.nanny respondsToSelector:@selector(feedFood:)]) {
        
        [self.nanny feedFood:self];
    }
}

- (void)sleepy
{
    self.sleep += 5;
    NSLog(@"困了 %i", self.sleep);
    
    // 通知保姆
    if ([self.nanny respondsToSelector:@selector(hongBaby:)]) {
        
        [self.nanny hongBaby:self];
    }
}
@end
