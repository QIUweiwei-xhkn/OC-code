//
//  main.m
//  03-多个对象的内存管理
//
//  Created by wei wei on 2025/12/26.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Room.h"

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        // 1.创建两个对象
        Person *p = [[Person alloc] init];
        Room *r = [[Room alloc] init];
        r.num = 999;
        
        // 将房间赋值给人
        // 人需要使用这间房，只要人在房间就一定在
        p.room = r;
    
        [r release];
        // 在这行前人还没释放
        NSLog(@"___________");
        
        // 人不在 房间必须释放
        [p release];
        
    }
    return 0;
}
