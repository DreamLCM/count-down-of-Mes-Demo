//
//  CountDown.h
//  短信验证码倒计时
//
//  Created by MAC on 16/5/4.
//  Copyright © 2016年 MAC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define COLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface CountDown : NSObject
- (void)forSeconds:(NSInteger)sec onLabel:(UILabel *)label andBtn1:(UIButton * )btn1 andBtn2:(UIButton * )btn2 WithString:(NSString *)string;
/**
 *  使用实例方法而不用类方法是为了使得一个实例对应一个Timer，方便实例销毁Timer
 *
 *  @param time             倒计时总时间/秒
 *  @param timeArriveAction 每1秒的动作
 *  @param timeoutAction    倒计时结束后的动作
 */
- (void)timerWithTimeInterval:(NSTimeInterval)time gap:(NSTimeInterval)gap timeArriveAction:(void(^)(NSInteger))timeArriveAction timeoutAction:(void(^)(NSInteger))timeoutAction;
/**
 *  取消倒计时
 */
- (void)invalidate;

@end
