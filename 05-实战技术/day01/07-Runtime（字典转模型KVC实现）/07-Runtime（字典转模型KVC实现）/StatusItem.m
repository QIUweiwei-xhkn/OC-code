//
//  StatusItem.m
//  07-Runtime（字典转模型KVC实现）
//
//  Created by wei wei on 2024/8/1.
//

#import "StatusItem.h"
// 模型只保存最重要的数据，导致模型的属性和字典不能一一对应

@implementation StatusItem
+ (instancetype)itemWithDict:(NSDictionary *)dict {
    StatusItem *item = [[StatusItem alloc] init];
    // KVC 把字典中所有值给模型的属性赋信
    [item setValuesForKeysWithDictionary:dict];
//    // 1.遍历dict中所有的key，去模型中查找是否有对应的属性
//    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        // 2.去模型中查找是否有对应的属性
//        [item setValue:obj forKey:key];
//    }];
    // 拿到每一个模型属性，去字典中取出对应的值，给模型賦值
    // 从字典中取值，不一定要全部取出来
    // MJExtension：字典转模型 runtime：可以把一个模型中所有属性遍历出来
    // MJExtension：封装了很多层
//    item.reposts_count = [dict[@"reposts_count"] integerValue];
//    item.pic_urls = dict[@"pic_urls"];
    
    return item;
}
/*
 ［item setValue：@"来自即刻笔记"forKey：@"source"'］：
     1.首先去模型中查找有没有setSource，找到，直接调用赋值 [self setSource：@”来自即刻笔记"］
     2.去模型中查找有没有source属性，有，直接访问属性赋值 source = value
     3.去模型中查找有没有_source属性，有，直接访问属性赋值 _source = value
     4.找不到，就会直接报
 */

/*
 *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<StatusItem 0x60000210fc50> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key source.'
 */

// 重写系统方法？1.想给系统方法添加额外功能 2.不想要系统方法实现
// 系统找不到就会调用这个方法，报错
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}
@end
