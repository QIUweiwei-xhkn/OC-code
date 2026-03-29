//
//  Nanny.m
//  04-protocol应用场景2-代理设计模式
//
//  Created by wei wei on 2023/10/29.
//

#import "Nanny.h"
#import "Baby.h"

@implementation Nanny
- (void)feedFood:(Baby *)baby
{
    baby.hungry -= 10;
    NSLog(@"保姆喂婴儿吃东西 %i", baby.hungry);
}

- (void)hongBaby:(Baby *)baby
{
    baby.sleep += 10;
    NSLog(@"保姆哄婴儿睡觉 %i", baby.sleep);
}

-(void)dealloc {
    NSLog(@"%s",__func__);
}
@end
