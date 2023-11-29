//
//  main.m
//  13-NSCalendar
//
//  Created by wei wei on 2023/11/27.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 1.获取当前时间的年月日时分秒
    /*
     // 获取当前时间
     NSDate *now = [NSDate date];
     NSLog(@"now = %@", now);
     //日历
     NSCalendar *calendar1 = [NSCalendar currentCalendar];
     // 利用日历类从当前时间对象中获取 年月日时分秒(单独获取出来)
     // components: 参数的含义是, 问你需要获取什么?
     // 一般情况下如果一个方法接收一个参数, 这个参数是是一个枚举 , 那么可以通过|符号, 连接多个枚举值
     NSCalendarUnit type = NSCalendarUnitYear |
                           NSCalendarUnitMonth |
                           NSCalendarUnitDay |
                           NSCalendarUnitHour |
                           NSCalendarUnitMinute |
                           NSCalendarUnitSecond;
     
     NSDateComponents *coms = [calendar1 components:type fromDate:now];
     NSLog(@"%ld年%ld月%ld日%ld小时%ld分钟%ld秒钟", coms.year, coms.month, coms.day, coms.hour, coms.minute, coms.second);
      
 //    NSInteger year = [calendar1 component:NSCalendarUnitYear fromDate:now ];
 //    NSLog(@" year = %lu", year);
     */
    
    // 2.比较两个时间之间的差值, 比较相差多少年多少月多少日多少小时多少分钟多少秒
    
    // 2.1过去的一个时间
    NSString *str = @"2023-11-27 23:47:53 +0000";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss Z";
    NSDate *date = [formatter dateFromString:str];
    
    // 2.2当前的时间
    NSDate *now = [NSDate date];
    NSLog(@"date = %@", date);
    NSLog(@"now = %@", now);
    
    // 2.3比较两个时间
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear |
                          NSCalendarUnitMonth |
                          NSCalendarUnitDay |
                          NSCalendarUnitHour |
                          NSCalendarUnitMinute |
                          NSCalendarUnitSecond;
    NSDateComponents *coms = [calendar components:type fromDate:date toDate:now options:0];
    NSLog(@"%ld年%ld月%ld日%ld小时%ld分钟%ld秒钟", coms.year, coms.month, coms.day, coms.hour, coms.minute, coms.second);
    return 0;
}
