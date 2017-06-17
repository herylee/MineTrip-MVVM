//
//  MineTripShowMessageView.h
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/11.
//  Copyright © 2017年 chit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineTripShowMessageView : NSObject
/**
 *  展示错误信息
 *
 *  @param message 信息内容
 */
+ (void)showErrorWithMessage:(NSString *)message;
/**
 *  展示成功信息
 *
 *  @param message 信息内容
 */
+ (void)showSuccessWithMessage:(NSString *)message;
/**
 *  展示提交状态
 *
 *  @param message 信息内容
 */
+ (void)showStatusWithMessage:(NSString *)message;
/**
 *  隐藏弹出框
 */
+ (void)hiddenErrorWithMessage;

@end
