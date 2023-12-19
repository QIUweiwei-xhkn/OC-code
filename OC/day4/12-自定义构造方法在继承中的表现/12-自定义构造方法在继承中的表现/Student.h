//
//  Student.h
//  12-自定义构造方法在继承中的表现
//
//  Created by wei wei on 2023/9/25.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student : Person
@property int no;
-(instancetype)initWithAge:(int)age andName:(NSString *)name andNo:(int)no;
@end

NS_ASSUME_NONNULL_END
