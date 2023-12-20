//
//  main.m
//  05-代理设计模式练习
//
//  Created by wei wei on 2023/10/29.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "LinkHome.h"
#import "LoveHome.h"

int main(int argc, const char * argv[]) {
    /*
     用代理实现学生找房子, 不具备找房子的能力
     所以学生可以找另一个对象来帮它找房子, 那么另一个对象就是学生的代理
     */
    Student *s = [[Student alloc] init];
    LinkHome *lh = [[LinkHome alloc] init];
    s.delegete = lh;
    
//    LoveHome *LoH = [[LoveHome alloc] init];
//    s.delegete = LoH;
    [s findHourse];
    return 0;
}
