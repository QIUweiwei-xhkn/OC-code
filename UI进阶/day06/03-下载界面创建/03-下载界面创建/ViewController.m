//
//  ViewController.m
//  03-下载界面创建
//
//  Created by wei wei on 2024/7/9.
//

#import "ViewController.h"
#import "progessView.h"
 
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lableText;
@property (weak, nonatomic) IBOutlet progessView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)valueChange:(UISlider *)sender {
    // 获得进度值
    NSLog(@"%.2f",sender.value);
    // %在stringwithFormat有特的含义，不能直接使用，如果想要使用用两个%代表一个%
    self.lableText.text = [NSString stringWithFormat:@"%.2f%%", sender.value * 100];
    
    self.progressView.progessValue = sender.value;
}

@end
