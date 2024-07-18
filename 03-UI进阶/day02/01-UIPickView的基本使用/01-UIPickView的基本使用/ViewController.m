//
//  ViewController.m
//  01-UIPickView的基本使用
//
//  Created by wei wei on 2024/5/10.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;

@end


@implementation ViewController
#pragma mark - UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 5;
}
// 返回每一列宽度
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
//    
//}
// 返回每一行高度
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 50;
}
// 每一行展示什么内容
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component == 0)
        return @"123";
    else
        return @"6578";
}

// 每一行展示什么内容,带有属性的字符串（大小，颜色，阴影，描边）
//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {} // attributed title is favored if both methods are implemented

//每一行展示什么样的视图
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}

// 当前选中的是哪一列哪一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"component=%ld-- row=%ld",component, row);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置数据源
    self.pickView.dataSource = self;
    // 2.设置代理
    self.pickView.delegate = self;
}


@end
