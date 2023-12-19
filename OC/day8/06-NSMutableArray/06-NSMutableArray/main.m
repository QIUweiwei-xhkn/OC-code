//
//  main.m
//  06-NSMutableArray
//
//  Created by wei wei on 2023/11/26.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    /*
     // 创建一个空的数组
     NSMutableArray *arrM = [NSMutableArray array];
     NSLog(@"%@", arrM);
     
     
     // 如何添加
     [arrM addObject:@"Qww"];
     NSLog(@"%@", arrM);
     // 将指定数组中的元素都取出来, 放到arrM中
     // 并不是将整个数组作为一个元素添加到arrM中
     [arrM addObjectsFromArray:@[@"qww", @"ww"]];
     // 注意: 以下是将整个数组作为一个元素添加
 //    [arrM addObject:@[@"qww", @"ww"]];
     NSLog(@"%@", arrM);
     
     
     // 如何插入
     [arrM insertObject:@"wwQ" atIndex:1];
     NSLog(@"%@", arrM);
     
     // 插入一组数据, 指定数组需要插入的位置, 和插入多少个
     NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 2)];
     [arrM insertObjects:@[@"Q", @"w"] atIndexes:set];
     NSLog(@"%@", arrM);
     
     
     // 如何删除
     [arrM removeObjectAtIndex:0];
     NSLog(@"%@", arrM);
     
     [arrM removeLastObject];
     NSLog(@"%@", arrM);
     
 //    [arrM removeAllObjects];
 //    NSLog(@"%@", arrM);
     
     [arrM removeObject:@"Q"];
     NSLog(@"%@", arrM);
     
     
     // 如何替换
 //    [arrM replaceObjectAtIndex:0 withObject:@"Qww"];
     arrM[0] = @"Qww";
     NSLog(@"%@", arrM);
     */
    
    
    // 注意: 不能通过@[]来创建一个可变数组, 因为@[]创建出来的是一个不可变的数组
    // 如果把一个不可变数组当做一个可变数组来使用, 会引发一个运行时的错误
//    NSMutableArray *arrM = @[@"qww", @"ww"];
//    [arrM addObject:@"Q"];
    return 0;
}
