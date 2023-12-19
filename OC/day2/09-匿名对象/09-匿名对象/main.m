//
//  main.m
//  09-匿名对象
//
//  Created by wei wei on 2023/9/13.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Ipone.h"

int main(int argc, const char * argv[]) {
    // 匿名就是没有名字, 匿名对象就是没有名字的对象
    
    // 1.有名字的对象
    // 只要用一个指针保存了某个对象的地址, 我们就可以称这个指针为某个对象
    // 称p为Person对象
    Person *p =[Person new]; // 0ffc12
    p->_age = 20;
    p->_name= @"weiwei";
    [p say];
    
    // 2.没有名字的对象
    // 无论有没有名字, 只要调用new方法都会返回对象的地址
    // 每次new都会新开辟一块存储空间
    [Person new]->_age = 20;
    [Person new]->_name = @"qww";
    [[Person new] say];
    
    
    // 3.匿名对象的应用场景
    // 3.1当对象只需要使用一次的时候就可以使用匿名对象
    Ipone *phone = [Ipone new];
    [phone brand];
    
    [[Ipone new] brand];
    
    // 3.2匿名对象可以作为方法的参数(实参)
    Person *p1 = [Person new];
//    Ipone *phone1 = [Ipone new];
//    [p1 signal:phone1];
    [p1 signal:[Ipone new]];
    return 0;
}
