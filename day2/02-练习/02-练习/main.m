//
//  main.m
//  02-练习
//
//  Created by wei wei on 2023/9/11.
//

/* #import <Foundation/Foundation.h>

 @interface Person : NSObject
 {
 @public
 int age;
 double height; // 成员变量不能在定义的时候进行初始化
 }
 - (void)study; // 方法只能写在{}外面
 
 // 缺少@end
 @end
 
 @implementation Person
 - (void)study
 {
 NSLog(@"年龄为%d的人在学习", age);
 }
 @end
 
 int main()
 {
 // 地址只能使用指针保存
 Person *p = [Person new];
 p->age = 10;
 p->height = 1.78f;
 [p study];
 return 0;
 }
 */

// 第2题：找出错误
//#import <Foundation/Foundation.h>
//@interface Test : NSObject
//- (int)addNum1:(int)num1 andNum2:(int)num2; // 有参数要有：
//- (double)pi; // 无参数不要：
//- (void)test; // 无数据类型不用()
//@end
//
//@implementation Test
//- (int)addNum1:(int)num1 andNum2:(int)num2
//{
//    return num1 + num2;
//}
//
//- (double)pi
//{
//    return 3.14;
//}
//
//- (void)test
//{
//
//}
//@end
//
//int main()
//{
//    return 0;
//}

// 第3题：找出错误
//#import <Foundation/Foundation.h>
//@interface Car : NSObject
//{
//@public
//    int wheels;
//}
//// 方法的声明必须写在类的声明中
//- (void)run;
//- (void)test;
//- (void)haha;
//@end
//
//@implementation Car
//- (void)test
//{
//    NSLog(@"测试一下车子：%i", wheels);
//}
//
//- (void) run
//{
//    NSLog(@"%i个轮子的车跑起来了", wheels);
//}
//- (void)haha
//{
//    NSLog(@"调用了haha");
//}
//@end
//
//
//int main()
//{
//    Car *c = [Car new];
//    [c run];
//    [c test]; // 对象成员要对象调用
//    [c haha];
//    return 0;
//}

// 第4题：分析输出结果
#import <Foundation/Foundation.h>
@interface Person : NSObject
{
@public
    int age;
    double height;
}
- (void)print;
@end

void test1(int newAge, double newHeight);
void test2(Person *newP);
void test3(Person *newP);
void test4(Person *newP);

int main()
{
    Person *p = [Person new];
    p->age = 10;
    p->height = 1.5f;
    
    test1(p->age, p->height);
    [p print]; // 10 1.5f
    test2(p);
    [p print]; // 20 1.7f
    test3(p);
    [p print]; // 20 1.7f
    test4(p);
    [p print]; // 60 1.9f
    return 0;
}
@implementation Person
- (void)print
{
    NSLog(@"年龄=%d，身高=%f", age, height);
}
@end

void test1(int newAge, double newHeight)
{
    newAge = 30;
    newHeight = 1.6;
}

void test2(Person *newP)
{
    newP->age = 20;
    newP->height = 1.7;
}

void test3(Person *newP)
{
    Person *p2 = [Person new];
    p2->age = 40;
    p2->height = 1.8;
    newP = p2; //注： newP 和 p2指向了同一块堆空间
    
    newP->age = 30;
}

void test4(Person *newP)
{
    Person *p2 = newP;
    p2->age = 50;
    p2->height = 1.9;
    newP->age = 60;
}
