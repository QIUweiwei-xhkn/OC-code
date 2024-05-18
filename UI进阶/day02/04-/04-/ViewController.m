//
//  ViewController.m
//  04-
//
//  Created by wei wei on 2024/5/14.
//

#import "ViewController.h"
#import "flag/FlagTextF.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *countryTextF;
@property (weak, nonatomic) IBOutlet UITextField *birthDayTextF;
@property (weak, nonatomic) IBOutlet UITextField *cityTextF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.countryTextF.delegate = self;
    self.birthDayTextF.delegate = self;
    self.cityTextF.delegate = self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return NO;
}

- (void)textFieldDidBeginEditing:(FlagTextF *)textField {
    [textField initWithText];
}
@end
