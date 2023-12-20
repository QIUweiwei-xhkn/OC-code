//
//  main.m
//  07-NSDictionary
//
//  Created by wei wei on 2023/11/26.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 1.如何创建
//    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"Qww" forKey:@"name"];
//    NSString *name = [dict objectForKey:@"name"];
//    NSLog(@"name = %@", name);
    
    // 注意: key和value 是一一对应
//    NSDictionary *dict = [NSDictionary dictionaryWithObjects:@[@"Qww", @"20", @"1.57"] forKeys:@[@"name", @"age", @"height"]];
//    NSLog(@"%@, %@, %@",[dict objectForKey:@"name"], [dict objectForKey:@"age"], [dict objectForKey:@"height"]);
    
//    NSDictionary *dict = @{key:value};
//    NSDictionary *dict = @{@"name": @"Qww"};
//    NSLog(@"%@",dict[@"name"]);
    
//    NSDictionary *dict = @{@"name": @"Qww", @"age":@"20", @"height":@"1.57"};
//    NSLog(@"%@ %@ %@", dict[@"name"], dict[@"age"], dict[@"height"]);
    
    // 2.字典的遍历
    NSDictionary *dict = @{@"name": @"Qww", @"age":@"20", @"height":@"1.57"};
    // 2.1如何获取字典中key和value的个数, 在字典中key称之为键, value称之为值
//    NSLog(@"count = %lu", dict.count);
//    NSLog(@"count = %lu", [dict count]);
//    
//    for(int i = 0; i < dict.count; i++) {
//        // 获取字典中所有的key
//        NSArray *keys = [dict allKeys];
//        // 取出当前位置对应的key
////        NSLog(@"%@", keys[i]);
//        NSString *key = keys[i];
//        NSString *value = dict[key];
//        NSLog(@"key = %@, value = %@", key, value);
//    }
    
    // 如何通过forin遍历字典, 会将所有的key赋值给前面的obj
//    for (NSString *key in dict) {
////        NSLog(@"%@", key);
//        NSString *value = dict[key];
//        NSLog(@"key = %@, value = %@", key, value);
//    }
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key = %@, value = %@", key, obj);
    }];
    
    // 3.字典文件读写
    // XML 扩展名plist
    [dict writeToFile:@"/Users/weiwei/Desktop/ios-basic/day8/07-NSDictionary/07-NSDictionary/dic.plist" atomically:YES];
    
    // 注意: 字典和数组不同, 字典中保存的数据是无序的
    NSDictionary *newDict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/weiwei/Desktop/ios-basic/day8/07-NSDictionary/07-NSDictionary/dic.plist"];
    NSLog(@"%@", newDict);
    
    NSArray *arr = @[@10, @20, @30, @5];
    [arr writeToFile:@"/Users/weiwei/Desktop/ios-basic/day8/07-NSDictionary/07-NSDictionary/abc.plist" atomically:YES];
    return 0;
}
