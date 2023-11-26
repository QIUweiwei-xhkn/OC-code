//
//  main.m
//  08-NSMutableArray
//
//  Created by wei wei on 2023/11/26.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 1.创建一个空的字典
    NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
    NSLog(@"%@", dicM);
    
    // 2.如何添加
    [dicM setObject:@"Qww" forKey:@"name"];
    NSLog(@"%@", dicM);
    // 会将传入字典中所有的键值对取出来添加到dictM中
    [dicM setValuesForKeysWithDictionary:@{@"age":@"20", @"height":@"1.57"}];
    NSLog(@"%@", dicM);
    
    // 3.如何获取
    NSLog(@"name = %@", dicM[@"name"]);
    
    // 4.如何删除
//    [dicM removeObjectForKey:@"name"];
//    NSLog(@"%@", dicM);
//    [dicM removeObjectsForKeys:@[@"age",@"height"]];
//    NSLog(@"%@", dicM);
    
    // 5.如何修改
    // 如果利用setObject方法给同名的key赋值, 那么新值会覆盖旧值
//    [dicM setObject:@"qww" forKey:@"name"];
    dicM[@"age"] = @"100";
    NSLog(@"%@", dicM);
    
    
    // 1.不能使用@{}来创建一个可变的字典
//    NSMutableDictionary *dicM2 = @{@"name":@"Qww"};
//    [dicM2 setObject:@"20" forKey:@"age"];
//    NSLog(@"%@", dicM2);
    
    // 2.如果是不可变数组, 那么key不能相同
    // 如果是不可变字典出现了同名的key, 那么后面的key对应的值不会被保存
    // 如果是在可变数组中, 后面的会覆盖前面的
    NSDictionary *dict = @{@"name":@"Qww", @"name":@"20"};
    NSLog(@"dict = %@", dict);
    NSMutableDictionary *dicM2 = [NSMutableDictionary dictionaryWithObjects:@[@"Qww",@"20"] forKeys:@[@"name",@"name"]];
    NSLog(@"dicM2 = %@", dicM2);
    return 0;
}
