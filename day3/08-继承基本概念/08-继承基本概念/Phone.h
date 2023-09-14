//
//  Phone.h
//  08-继承基本概念
//
//  Created by wei wei on 2023/9/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Phone : NSObject  {
    int _cpu;
}

- (void)signalWithNumer:(NSString *)number;

- (void)sendMessageWithNumber:(NSString*)number andContent:(NSString *)content;

+ (void)brand;
@end

NS_ASSUME_NONNULL_END
