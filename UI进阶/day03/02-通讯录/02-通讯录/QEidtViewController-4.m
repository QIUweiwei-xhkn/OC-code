//
//  QEidtViewController-4.m
//  02-通讯录
//
//  Created by wei wei on 2024/5/20.
//

#import "QEidtViewController-4.h"
#import "QAccountItem.h"

@interface QEidtViewController_4 ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end


@implementation QEidtViewController_4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameTextF.text = self.accountTitem.name;
    self.phoneTextF.text = self. accountTitem.phone;
 
}
- (IBAction)editBtnClick:(id)sender {
    self.nameTextF.enabled = !self.nameTextF.enabled;
    self.phoneTextF.enabled = !self.phoneTextF.enabled;
    self.saveBtn.hidden = !self.saveBtn.hidden;
}

- (void)setAccountTitem:(QAccountItem *)accountTitem {
    _accountTitem = accountTitem;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
