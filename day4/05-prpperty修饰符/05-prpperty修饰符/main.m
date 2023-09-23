//
//  main.m
//  05-prpperty修饰符
//
//  Created by wei wei on 2023/9/22.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc] init];
//    p.age = 100;
//    p.height = 1.67;
//    p.weight = 100;
//    p.name = @"Qiuweiwei";
    p.height = 199;
    NSLog(@"height = %f",[p abc]);
    [p abc];
    
    [p setMarried:YES];
//    if ([p married]) {
//            NSLog(@"已婚");
//        }else
//        {
//            NSLog(@"未婚");
//        }
    if ([p isMarried]) {
        NSLog(@"已婚");
    }else
    {
        NSLog(@"未婚");
    }
    return 0;
}
