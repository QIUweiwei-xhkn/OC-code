//
//  ProvinceTextF.m
//  04-
//
//  Created by wei wei on 2024/5/15.
//

#import "ProvinceTextF.h"
#import "ProvinceItem.h"

@interface ProvinceTextF () <UIPickerViewDelegate, UIPickerViewDataSource>
/** 存放省份模型数组   */
@property(nonatomic, strong) NSArray *dataArray;
/** 当前选中的省份的角标   */
@property(nonatomic, assign) NSInteger proIndex;
/** <#注释#>   */
@property(nonatomic, weak) UIPickerView *pick;
@end

@implementation ProvinceTextF
- (NSArray *)dataArray {
    if(_dataArray == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"province.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            // 把字典转模型
            ProvinceItem *item = [ProvinceItem itemWithDict:dict];
            [tempArr addObject:item];
        }
        _dataArray = tempArr;
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
    return 2;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if(component == 0) {
        return self.dataArray.count;
    }else {
        ProvinceItem *item = self.dataArray[self.proIndex];
        return item.cities.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component == 0) {
        ProvinceItem *item = self.dataArray[row];
        return item.name;
    }else {
        ProvinceItem *item = self.dataArray[self.proIndex];
        return item.cities[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if(component == 0) {
//        NSLog(@"%ld", row);
        self.proIndex = row;
        // 第一列选中第0行
        [pickerView selectRow:0 inComponent:1 animated:YES];
        // 刷新数据
        [pickerView reloadAllComponents];
    }
    // 取出当前选中的省份
    ProvinceItem *item = self.dataArray[self.proIndex];
    NSString *provinceName = item.name;
    // 获取第一列选中的行
    NSInteger cityRow = [pickerView selectedRowInComponent:1];
    NSString *cityName = item.cities[cityRow];
    self.text =  [NSString stringWithFormat:@"%@-%@", provinceName, cityName];
}

- (void)initWithText {
    [self pickerView:self.pick didSelectRow:0 inComponent:0];
}
@end

