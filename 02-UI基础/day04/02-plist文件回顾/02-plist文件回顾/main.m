//
//  main.m
//  02-plist文件回顾
//
//  Created by wei wei on 2024/1/30.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 数组
        /*
         NSArray *names = @[@"QWW", @"jix", @"jsi", @"koe"];
         BOOL flag = [names writeToFile:@"/Users/weiwei/Desktop/names.plist" atomically:YES];
         

         */

        /*
         NSDictionary *person = @{
             @"name" : @"QWW",
             @"age" : @20,
             @"height" : @1.75
         };
         
         BOOL flag = [person writeToFile:@"/Users/weiwei/Desktop/persons.plist" atomically:YES];
         */

        /*
         NSArray *persons = @[
             @{@"name": @"Qww", @"age" : @20, @"height" : @1.75},
             @{@"name": @"ww", @"friends" : @[@"hihao", @"haha"]}
         ];
         BOOL flag = [persons writeToFile:@"/Users/weiwei/Desktop/persons.plist" atomically:YES];
         if(flag) {
             NSLog(@"写入成功!");
         }
         */
        
        NSArray *shopData = @[
            @{@"name":@"链条包", @"icon": @"baobao_1"},
            @{@"name":@"单肩包", @"icon": @"baobao_2"},
            @{@"name":@"斜挎包", @"icon": @"baobao_3"},
            @{@"name":@"双肩包", @"icon": @"baobao_4"},
            @{@"name":@"手提包", @"icon": @"baobao_5"},
            @{@"name":@"钱包", @"icon": @"baobao_6"},
        ];
        BOOL flag = [shopData writeToFile:@"/Users/weiwei/Desktop/persons.plist" atomically:YES];
        if(flag) {
            NSLog(@"写入成功!");
        }
        
//        NSArray *persons = [NSArray arrayWithContentsOfFile:@"/Users/weiwei/Desktop/persons.plist"];
//        NSLog(@"%@", persons);
    };
    return 0;
}

