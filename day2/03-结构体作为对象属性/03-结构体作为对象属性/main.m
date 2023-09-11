//
//  main.m
//  03-结构体作为对象属性
//
//  Created by wei wei on 2023/9/11.
//

#import <Foundation/Foundation.h>

/*
 合理的设计一个”学生“类
 学生有* 姓名* 生日两个属性和说出自己姓名生日方法
 要求利用设计的学生类创建学生对象，并说出自己的姓名和年龄
 
 描述学生类
 
 事物名称: 学生(Student)
 属性:姓名(name), 生日(birthday)
 行为:说出字节姓名和生日(say)
 */
typedef struct
 {
    int year;
    int month;
    int day;
} Date;

@interface Student : NSObject {
    @public
    NSString *_name;
//    struct Date birthday;
    Date _birthday;
}
-(void)say;
@end

@implementation Student
-(void)say{
    NSLog(@"name is %@，year is %i, month is %i,day is %i",_name, _birthday.year, _birthday.month, _birthday.day);
}
@end

int main(int argc, const char * argv[]) {
    // 1.创建学生对象
    // 1.开辟存储空间
    // 2.初始化属性
    // 3.返回地址
    Student *student = [Student new];
    
    // 2.设置学生对象的属性
    student->_name = @"Qiu weiwei";
    // 1.结构体只能在定义的时候初始化
    // 2.系统并不清楚它是数组还是结构体
    //初始化结构体属性
    //方法一:强制转换
//    student->_birthday = (Date){2003, 05, 24};
    
    //方法二:定义一个新的结构体,给d赋值,将d赋值给_birthday
    Date d = {1986, 1, 15};
    student->_birthday = d;
    
    //方法三:分别赋值
//    student->_birthday.year = 1986;
//    student->_birthday.month = 1;
//    student->_birthday.day = 15;
    
    // 3.让学生说出自己的姓名和生日
    [student say];
    
//    Date d1 = {1999,2,5};
//    Date d2 = d1;  // 本质是将d1所有的属性的值都拷贝了一份赋值给d;
//    d2.year = 1977;
//    printf("d1 = year = %i\n",d1.year);
//    printf("d2 = year = %i\n",d2.year);
    return 0;
}
