//
//  QAddContactViewController-3.m
//  02-通讯录
//
//  Created by wei wei on 2024/5/19.
//

#import "QAddContactViewController-3.h"
#import "QAccountItem.h"


@interface QAddContactViewController_3 ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextF;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextF;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end

@implementation QAddContactViewController_3
// 开发中的原则
// 1.低耦合（减少控制器与控制器的关联）（解耦）
// 2.高内聚（抽取方法）

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.phoneTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    // 手动判断账号密码都有值的
    [self textChange];
}


- (void)textChange {
    self.addBtn.enabled = self.nameTextF.text.length && self.phoneTextF.text.length;
}
- (IBAction)addBtnClick:(id)sender {
    // 把输入的联系人姓名和电话号码输入给上一个控制器（QContactViewController-2）
   // 把输入的联系人姓名和电话号码封装成一个模型
    QAccountItem *item = [QAccountItem initWithName:self.nameTextF.text phone:self.phoneTextF.text];
//    self.contactVC.contactItem = item; 
    // 返回上一级
//    [self.navigationController popViewControllerAnimated:YES];
     
    // 判断代理有没有实现代理方法
    if([self.delegate respondsToSelector:@selector(addContactVC:accountItem:)]) {
        [self.delegate addContactVC:self accountItem:item];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
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
