//
//  ViewController.m
//  短信验证码倒计时
//
//  Created by MAC on 16/5/4.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "ViewController.h"
#import "CountDown.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController
{
    CountDown * timer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)buttonAction:(UIButton *)sender {
    
    timer = [[CountDown alloc]init];
    [timer timerWithTimeInterval:60 gap:1 timeArriveAction:^(NSInteger leftTime) {
        //设置界面的按钮显示 根据自己需求设置
        self.label.text = [NSString stringWithFormat:@"      %@秒",[@(leftTime) stringValue]];
        self.button.hidden = YES;
        self.label.hidden = NO;
        self.label.backgroundColor = [UIColor lightGrayColor];
    } timeoutAction:^(NSInteger leftTime) {
        self.button.hidden = NO;
        self.label.hidden = YES;
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
