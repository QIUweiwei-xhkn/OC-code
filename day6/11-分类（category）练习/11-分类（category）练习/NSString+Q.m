//
//  NSString+Q.m
//  11-分类（category）练习
//
//  Created by wei wei on 2023/10/28.
//

#import "NSString+Q.h"

@implementation NSString (Q)
+(int)countWithStr:(NSString *)str {
    int count = 0;
      for(int i = 0; i <  str.length; i++) {
          unichar c = [str  characterAtIndex:i];
          if(c >= '0' && c <= '9') {
              count++;
          }
      }
    return count;
}
-(int)count {
    int number = 0;
    for(int i = 0; i <  self.length; i++) {
        unichar c = [self  characterAtIndex:i];
        if(c >= '0' && c <= '9') {
            number++;
        }
    }
  return number;
}
@end
