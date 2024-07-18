//
//  QWineCell.m
//  01-购物车案例
//
//  Created by wei wei on 2024/4/1.
//

#import "QWineCell.h"
#import "QWine.h"
#import "QCircleButton.h"
#import "ViewController.h"
//#import "ViewController.h"

@interface QWineCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
@property (weak, nonatomic) IBOutlet UILabel *countLable;
@property (weak, nonatomic) IBOutlet QCircleButton *minusButton;


@end


@implementation QWineCell
- (void)setWine:(QWine *)wine {
    _wine = wine;
    self.imageImageView.image = [UIImage imageNamed:wine.image];
    self.nameLabel.text = wine.name;
    self.moneyLable.text = [NSString stringWithFormat:@"¥%@", wine.money];
    
//    // 根据conut决定countLable显示的文字
    self.countLable.text = [NSString stringWithFormat:@"%d",wine.count];
    // 根据count决定减号按钮是否能点击
    self.minusButton.enabled = (wine.count > 0);
}
/**
 *  加号点击
 */
- (IBAction)plusButtonClick {
    // 修改模型
    self.wine.count++;
//    [self setWine:self.wine];
//    self.wine = self.wine;
    // 修改界面
    self.countLable.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    // 减号按钮能点击
    self.minusButton.enabled = YES;
    
    // 发布通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"plusClickNotification" object:self];
      
    // 通知代理(调用代理的方法）
//    [self.delegate plusClick_vc];
    if([self.delegate respondsToSelector:@selector(QWineCellDidClickPlusButton:)]) {
        [self.delegate QWineCellDidClickPlusButton:self];
    }
    
}



/**
 *  减号点击
 */
- (IBAction)minusButtonClick {
    // 修改模型
    self.wine.count--;
    
    // 修改界面
    self.countLable.text = [NSString stringWithFormat:@"%d",self.wine.count];
    
    if(self.wine.count == 0) {
        self.minusButton.enabled = NO;
    }
    
    // 发布通知
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"minusClickNotification" object:self];
    
    // 通知代理
//    [self.delegate minusClick_vc];
    if([self.delegate respondsToSelector:@selector(QWineCellDidClickminusButton:)]) {
        [self.delegate QWineCellDidClickminusButton:self];
    }
}
@end
