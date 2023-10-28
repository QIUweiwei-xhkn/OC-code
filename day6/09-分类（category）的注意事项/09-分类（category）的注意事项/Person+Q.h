//
//  Person+Q.h
//  09-分类（category）的注意事项
//
//  Created by wei wei on 2023/10/28.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

// 1.分类是用于给原有类添加方法的, 它只能添加方法, 不能添加属性(成员变量)
@interface Person (Q)
//{
//    double _height;
//} // Instance variables may not be placed in categories

// 2.分类中的@property, 只会生成setter/getter方法的声明, 不会生成实现以及私有的成员变量
//@property(nonatomic, assign)double height;

-(void)hello;
@end

NS_ASSUME_NONNULL_END
