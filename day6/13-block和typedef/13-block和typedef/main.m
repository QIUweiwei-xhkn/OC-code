//
//  main.m
//  13-block和typedef
//
//  Created by wei wei on 2023/10/28.
//

#import <Foundation/Foundation.h>
int sum(int value1, int value2) {
    return value1 + value2;
}

int munis(int value1, int value2) {
    return value1 - value2;
}

typedef int (*calculate)(int,int);

// 注意: 利用typedef给block起别名, 和指向函数的指针一样, block变量的名称就是别名
typedef int (^calculateBlock)(int,int);

int main(int argc, const char * argv[]) {
////    int (*sump)(int,int);
////    sump = sum;
//    calculate sump = sum;
//    NSLog(@"sum = %i", sump(20,10));
//    
////    int (*munisp)(int,int);
////    munisp = munis;
//    calculate munisp = munis;
//    NSLog(@"munis = %i", munisp(20,10));

//    int (^sumBlock)(int,int);
    calculateBlock sumBlock = ^(int value1, int value2) {
        return value1 + value2;
    };
    NSLog(@"sum = %i", sumBlock(20,10));
    
//    int (^munisBlock)(int,int);
    calculateBlock munisBlock = ^(int value1, int value2) {
        return value1 - value2;
    };
    NSLog(@"munis = %i", munisBlock(20,10));
    return 0;
}
