//
//  NSObject+model.m
//  07-Runtime（字典转模型KVC实现）
//
//  Created by wei wei on 2024/8/1.
//

#import "NSObject+model.h"
#import "objc/message.h"
#import "UserItem.h"

// 获取类里面的方法
//class_copyMethodList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
@implementation NSObject (model)
// 本质：创建谁的对象
+ (instancetype)modelWithDict:(NSDictionary *)dict {
    id objc = [[self alloc] init];
    // Ivar：成员变量，以下划线开头
    // Property：属性
    // runtime:遍历模型中的属性在字典中查找对应的value 并给模型赋值
    // 1.获取模型中所有属性 key
//    class_copyPropertyList(<#Class  _Nullable __unsafe_unretained cls#>, <#unsigned int * _Nullable outCount#>)
    // 获得哪个类的成员变量
    // count：成员变量的个数
    unsigned int count = 0;
    // 获得成员变量数组
    Ivar *ivarList = class_copyIvarList(self, &count);
    // 遍历
    for(int i = 0; i < count; i++) {
        // 获得成员变量
        Ivar ivar = ivarList[i];
        // 获得成员变量名称
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        // 获得key
        NSString *key = [ivarName substringFromIndex:1];
        // 去字典中查找对应的value
        id value = dict[key];
        // 获得成员变量类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        // @\"UserItem\" --> UserItem
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        ivarType = [ivarType stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        // 二级转换：判断value是否是自定义字典，如果是对应转成模型
        if([value isKindOfClass:[NSDictionary class]] && ![ivarType hasPrefix:@"NS"]) {
            // 字典转模型 userDict ==> userItem
            // 转化成哪个模型
            
            // 获得类
            Class modelClass = NSClassFromString(ivarType);
            NSLog(@"%@", ivarType);
            value = [modelClass modelWithDict:value];
        }
        
        // 给模型中的属性赋值
        if(value) {
            [objc setValue:value forKey:key];
        }
    }
//    test(&count);
//    NSLog(@"%d", count);
    return objc;
}

void test(int *count) {
    *count = 3;
}
@end
