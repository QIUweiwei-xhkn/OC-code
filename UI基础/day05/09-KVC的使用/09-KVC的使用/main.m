//
//  main.m
//  09-KVC的使用
//
//  Created by wei wei on 2024/2/7.
//

/**
 *  KVC: Key Value Coding （键值编码）
 *  
 */

#import <Foundation/Foundation.h>
#import "QPerson.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /**
         *  取出数组中所有模型的某个数据
         */
        QPerson *person1 = [[QPerson alloc] init];
        person1.name = @"zhangsan";
        person1.age = 18;
        
        QPerson *person2 = [[QPerson alloc] init];
        person2.name = @"lisi";
        person2.age = 19;
        
        QPerson *person3 = [[QPerson alloc] init];
        person3.name = @"wangwu";
        person3.age = 20;
    
        NSArray *allPersons = @[person1, person2, person3];
        NSArray *allPersonName = [allPersons valueForKey:@"name"];
        
        NSLog(@"%@", allPersonName);
    }
    return 0;
}

/**
 *  把模型转成字典
 */
void test6() {
    QPerson *person = [[QPerson alloc] init];
    person.name = @"张三";
    person.age = 18;
    
    NSDictionary *dict = [person dictionaryWithValuesForKeys:@[@"name", @"age"]];
    NSLog(@"%@", dict);
}

/**
 *  取值
 */
void test5() {
    QPerson *person = [[QPerson alloc] init];
    person.name = @"张三";
    person.age = 18;
    
    // 利用KVC取值
    NSLog(@"%@------%d",[person valueForKeyPath:@"name"], [[person valueForKey:@"age"] intValue]);
}


/**
 *作用：字典转模型
 *  开发中不建议使用 setValuesForKeysWithDictionary：
 *  1.字典中的key必须在模型的属性中找到
 *  2.  如果模型中带有模型，setValuesForKeysWithDictionary不好使
 *  应用场景：简单的字典转换 -----> 框架（MJExtention）
 */
void test4() {
    NSDictionary *dict = @{
        @"name": @"张三",
        @"age": @18,
        @"no": @"1",
        @"dog": @{
            @"name": @"旺财",
            @"money": @188.5
        },
        @"books": @[
            @{@"name":@"ios快速开发", @"price":@199},
            @{@"name":@"快速开发", @"price":@19},
            @{@"name":@"ios开发", @"price":@189}
        ]
    };
    
    QPerson *person = [[QPerson alloc] initWithDict:dict];
    NSLog(@"%@", person.dog.class);
    
    [person setValue:@{
        @"name": @"旺财",
        @"money": @188.5
    } forKeyPath:@"dog"];

}


/**
 *   利用KVC修改类的私有成员变量(UIPageControl)
 */
void test3() {
    QPerson *person = [[QPerson alloc] init];
//        person->_age =
    
    [person printAge];
    [person setValue:@"88" forKeyPath:@"_age"];
    [person printAge];
}


/**
 *  利用KVC进行综合赋值
 */
void test2() {
    QPerson *person = [[QPerson alloc] init];
    person.dog = [[Dog alloc] init];
//        person.dog.name = @"旺财";
    
    // KVC 赋值
    /**
     *  forKey 和 forKeyPath
     *   1.forKeyPath 包含了所有的 forKey 的功能
     *   2.forKeyPath 进行内部的点语法，层层访问内部的属性
     *   3.注意：key值一定要在属性中找到
     */
//        [person.dog setValue:@"阿黄" forKey:@"name"];
    [person setValue:@"旺财" forKeyPath:@"dog.name"];
    NSLog(@"%@", person.dog.name);
}


/**
 *  利用KVC进行简单赋值
 */
void test() {
    // 常规赋值
     QPerson *person = [[QPerson alloc] init];
    /*
     person.name = @"张三";
     person.age = 18;
     */
    
    // KVC赋值
    [person setValue:@"王五" forKey:@"name"];
    [person setValue:@"19" forKeyPath:@"age"]; // 自动类型转换
    NSLog(@"%@------%d", person.name, person.age);
}
