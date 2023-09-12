#import <Foundation/Foundation.h>
#import "Kline.h"
/*
 设计一个K线类, 有三个属性, 最高价格, 最低价格, 平均价格. 要求可以设置和获取这三个属性
 */
int main(int argc, const char * argv[]) {
    Kline *line = [Kline new];
    [line setMax:200];
    [line setMin:100];
    NSLog(@"min = %i, max = %i, average = %i", [line min], [line max], [line average]);
    
    [line setMin:50];
    [line average];
    NSLog(@"min = %i, max = %i, average = %i", [line min], [line max], [line average]);
    return 0;
}
