//
//  MineTripShowMessageView.m
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/11.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MineTripShowMessageView.h"
#import <SVProgressHUD.h>

@implementation MineTripShowMessageView

+ (void)showErrorWithMessage:(NSString *)message
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.5f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showInfoWithStatus:message];
    
}
+ (void)showSuccessWithMessage:(NSString *)message
{
    [SVProgressHUD setMinimumDismissTimeInterval:1.5f];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showSuccessWithStatus:message];
}
+ (void)showStatusWithMessage:(NSString *)message
{
    [SVProgressHUD showWithStatus:message];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}
+ (void)hiddenErrorWithMessage
{
    [SVProgressHUD dismiss];
}

@end
