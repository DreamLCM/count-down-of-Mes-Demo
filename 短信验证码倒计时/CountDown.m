//
//  CountDown.m
//  短信验证码倒计时
//
//  Created by MAC on 16/5/4.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import "CountDown.h"

@implementation CountDown
{
    NSTimer *timer;
}
- (void)timerWithTimeInterval:(NSTimeInterval)time gap:(NSTimeInterval)gap timeArriveAction:(void(^)(NSInteger))timeArriveAction timeoutAction:(void(^)(NSInteger))timeoutAction
{
    if (time > 0) {
        timeArriveAction(time);
        NSDictionary *action = @{@"TimeArriveAction":timeArriveAction,@"TimeoutAction":timeoutAction,@"TotalTime":@(time),@"gap":@(gap)};
        timer = [NSTimer timerWithTimeInterval:gap target:self selector:@selector(timerAction:) userInfo:action repeats:NO];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        return;
    }
    if (time == 0) {
        timeoutAction(time);
        [timer invalidate];
        return;
    }
    
}
- (void)timerAction:(NSTimer *)actionTimer
{
    [self timerWithTimeInterval:[actionTimer.userInfo[@"TotalTime"] doubleValue] - 1 gap:[actionTimer.userInfo[@"gap"] doubleValue] timeArriveAction:actionTimer.userInfo[@"TimeArriveAction"] timeoutAction:actionTimer.userInfo[@"TimeoutAction"]];
    [actionTimer invalidate];
}
- (void)forSeconds:(NSInteger)sec onLabel:(UILabel*)label andBtn1:(UIButton *)btn1 andBtn2:(UIButton *)btn2 WithString:(NSString *)string {
    
    [self timerWithTimeInterval:sec gap:1 timeArriveAction:^(NSInteger leftTime) {
        btn1.userInteractionEnabled = NO;
        btn2.userInteractionEnabled = NO;
        NSString *str = [NSString stringWithFormat:@"%ld%@",(long)leftTime,string];
        label.textColor = COLOR(191, 196, 199, 1);
        label.text = str;
    } timeoutAction:^(NSInteger leftTime) {
        btn1.userInteractionEnabled = YES;
        btn2.userInteractionEnabled = YES;
        label.textColor = COLOR(49, 198, 247, 1);
        }];
    
}

- (void)invalidate
{
    [timer invalidate];
}
- (void)dealloc
{
    [timer invalidate];
}

@end
