//
//  main.m
//  10-NSNumber
//
//  Created by wei wei on 2023/11/27.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int age = 10;
    double number = 5.1;
    int value = 6;
//    NSArray *arr = @[age, number, value]; // Collection element of type 'int' is not an Objective-C object
    
    // 1.将基本数据类型转换为对象类型
    NSNumber *ageN = [NSNumber numberWithInt:age];
    NSNumber *numberN = [NSNumber numberWithDouble:number];
    NSNumber *valueN = [NSNumber numberWithInt:value];
    
    NSArray *arr = @[ageN, numberN, valueN];
    NSLog(@"arr = %@", arr);
    
    // 2.将对象类型转换为基本数据类型
    int temp = [ageN intValue];
    double temp2 = [numberN doubleValue];
    NSLog(@"%i", temp);
    NSLog(@"%f", temp2);
    
    // 3.基本数据类型转换对象类型简写
    // 注意: 如果传入的是变量那么必须在@后面写上(), 如果传入的常量, 那么@后面的()可以省略
    NSNumber *temp3 = @(number);
    NSNumber *temp4 = @10.10;
    NSLog(@"%@", temp3);
    NSLog(@"%@", temp4);
    return 0;
}
