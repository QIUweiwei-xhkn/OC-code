//
//  main.m
//  20-自定义类实现copy
//
//  Created by wei wei on 2023/12/2.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
//    1.以后想让自定义的对象能够被copy只需要遵守NSCopying协议
//    2.实现协议中的- (id)copyWithZone:(NSZone *)zone
//    3.在- (id)copyWithZone:(NSZone *)zone方法中创建一个副本对象, 然后将当前对象的值赋值给副本对象即可

//    Person *p1 = [[Person alloc] init];
//    p1.age = 20;
//    p1.name = @"Qww";
//    NSLog(@"%@", p1);
//    
//    Person *p2 = [p1 copy];
////    Person *p2 = [p1 mutableCopy];
//    NSLog(@"%@", p2);
    
    Student *stu1 = [[Student alloc] init];
    stu1.age = 20;
    stu1.name = @"Qww";
    stu1.height = 1.57;
    NSLog(@"stu1 = %@", stu1);
    
    // 如果想让子类在copy的时候保留子类的属性, 那么必须重写copyWithZone方法, 在该方法中先调用父类创建副本设置值, 然后再设置子类特有的值
    Student *stu2 = [stu1 copy];
    NSLog(@"stu2 = %@", stu2);
    return 0;
}
