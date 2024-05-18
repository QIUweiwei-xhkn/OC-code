//
//  FlagTextF.m
//  04-
//
//  Created by wei wei on 2024/5/14.
//

#import "FlagTextF.h"
#import "FlagItem.h"
#import "FlagView.h"

@interface FlagTextF () <UIPickerViewDelegate, UIPickerViewDataSource>
/** 加载的数据   */
@property(nonatomic, strong) NSArray *dataArray;
/** <#注释#>   */
@property(nonatomic, weak) UIPickerView *pick;
@end

@implementation FlagTextF
- (NSArray *)dataArray {
    if(_dataArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        // 把数组中的字典转化成模型
        for (NSDictionary *dict in array) {
            FlagItem *item = [FlagItem itemWithDict:dict];
            [tempArray addObject:item];
        }
        _dataArray = tempArray;
    }
    return _dataArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // 初始化文本框
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self setUp];
    }
    return self;
}

// 初始化文本框
- (void)setUp {
    // 创建 UIPickView
    UIPickerView *pick = [[UIPickerView alloc] init];
    pick.delegate = self;
    pick.dataSource = self;
    // 修改弹出文本框键盘类型
    self.inputView = pick;
}


#pragma mark - 实现协议方法
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArray.count;
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    FlagView *flagView = [FlagView flagView];
    // 取出当前模型
    FlagItem *item = self.dataArray[row];
    flagView.item = item;
    
    return flagView;
}


// 返回pickView的高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 80;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    FlagItem *item = self.dataArray[row];
    self.text = item.name;
}

- (void)initWithText {
    [self pickerView:self.pick didSelectRow:0 inComponent:0];
}

@end
