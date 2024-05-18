//
//  ViewController.m
//  02-UIPickView简单Demo
//
//  Created by wei wei on 2024/5/10.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
/** 存放加载的数据   */
@property(nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController
- (NSArray *)dataArray {
    if(_dataArray==nil) {
        NSString *path =[[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
        _dataArray = [NSArray arrayWithContentsOfFile:path];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置数据源
    self.pickView.dataSource = self;
    // 2.设置代理
    self.pickView.delegate = self;
    [self pickerView:self.pickView didSelectRow:0 inComponent:0];
}

#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.dataArray.count;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSArray *array = self.dataArray[component];
    return array.count;
}

// 每一列的每一行的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSArray *array = self.dataArray[component];
    return array[row];
}

// 当前选中的是哪一列哪一行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.nameLable.text = self.dataArray[component][row];
}
@end
