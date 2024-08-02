//
//  ViewController.m
//  01-IOS9新特性之泛型
//
//  Created by wei wei on 2024/7/31.
//

#import "ViewController.h"
#import "Person.h"
#import "IOS.h"
#import "Java.h"

/*
     泛型：限制类型
     为什么要推出泛型？迎合swift
     泛型作用：2.限制类型 2.提高代码规划，减少沟通成本，一看就知道集合中是什么东西
     泛型定义用法：类型<限制类型＞
     
     泛型声明：在声明类的时候，在类的后面<泛型名称＞泛型仅仅是报警告
     泛型好处：1.从数组中取出来，可以使用点语法
     2.给数组添加元素，有提示
     泛型在开发中使用场景：1.用于限制集合类型
     id是不能使用点语法
     
     为什么集合可以使用泛型？使用泛型，必须要先声明泛型？=> 如何声明泛型自定义泛型？
     什么时候使用泛型？在声明类的时候，不确定某些属性或者方法类型，在使用这个类的时候才确定，就可以采用泛型
     
     自定义Person，会一些编程语言（105,Java），在声明Person，不确定这个人会什么，在使用Person才知道这个Person会什么语言如果没有定义泛型，默认就是id
     
     用于父子类型转换
     泛型：__covariant：协变，子类转父类
          __contravariant：逆变 父类转子类
 
     泛型注意点：在数组中，一般用可变数组添加方法，泛型才会生效，如果使用不可变数组，添加元素，泛型没有效果
 */


@interface ViewController ()
/** <#注释#>   */
@property(nonatomic, strong) NSArray<NSString *> *arr;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 父类转子类
    Language *language = [[Language alloc] init];
    Person<Language *> *p = [[Person alloc] init];
    p.language = language;
    
    Person<IOS *> *p1 = [[Person alloc] init];
    p1 = p;
    
}



// 子类转父类
- (void)covariant {
    IOS *ios = [[IOS alloc] init];
    Person<IOS *> *p1 = [[Person alloc] init];
    p1.language = ios;
    
    Person<Language *> *p = [[Person alloc] init];
    p = p1;
}

- (void)test {
    //    [self.arr addObject:@"123"];
    //    self.arr[0].length
        
        Java *java = [[Java alloc] init];
        IOS *ios = [[IOS alloc] init];
        
        // ios
        Person<IOS *> *p1 = [[Person alloc] init];
        p1.language = ios;
        
        // java
        Person<Java *> *p2 = [[Person alloc] init];
        p2.language = java;
}
@end
