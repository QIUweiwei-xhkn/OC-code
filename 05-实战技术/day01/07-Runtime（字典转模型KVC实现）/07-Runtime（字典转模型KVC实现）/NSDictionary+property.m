//
//  NSDictionary+property.m
//  07-Runtime（字典转模型KVC实现）
//
//  Created by wei wei on 2024/8/1.
//

#import "NSDictionary+property.h"

@implementation NSDictionary (property)
// 生成属性代码，根据字典中所有key
- (void)creatProtertyCode {
    // 遍历字典
    NSMutableString *codes = [NSMutableString string];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSLog(@"%@", [obj class]);
        NSString *code;
        // isKindOfClass:判断是否适当前类或是其子类
        if([obj isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, strong) NSString *%@;", key];
        }else if([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, assign) BOOL %@;", key];
        }else if([obj isKindOfClass:[NSNumber class]]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, assign) NSInteger %@;", key];
        }else if([obj isKindOfClass:[NSArray class]]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, strong) NSArray *%@;", key];
        }else if([obj isKindOfClass:[NSDictionary class]]) {
            code = [NSString stringWithFormat:@"@property(nonatomic, strong) NSDictionary *%@;", key];
        }
        [codes appendFormat:@"\n%@\n", code];
    }];
    
    NSLog(@"%@", codes);
}


@end
