//
//  DateTextF.m
//  04-
//
//  Created by wei wei on 2024/5/14.
//

#import "DateTextF.h"
@interface DateTextF ()
/** <#注释#>   */
@property(nonatomic, weak) UIDatePicker *dataPick;
@end
@implementation DateTextF

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self setUp];
    }
    return self;
}

// 初始化
-(void)setUp {
    UIDatePicker *datePick = [[UIDatePicker alloc] init];
    //修改datePick日期模式
    datePick.datePickerMode = UIDatePickerModeDate;
    datePick.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    // 监听日期改变
    [datePick addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    // 日期键盘
    self.inputView = datePick;
    self.dataPick = datePick;
}

- (void)dateChange:(UIDatePicker *)datePick {
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    // 把当前的日期转换成字符串
    self.text = [fmt stringFromDate:datePick.date];
}

- (void)initWithText {
    [self dateChange:self.dataPick];
}
@end
