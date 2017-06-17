//
//  Config.h
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/11.
//  Copyright © 2017年 chit. All rights reserved.
//

#ifndef Config_h
#define Config_h

//懒加载
#define MY_LAZY(object,assignment)  (object = object ?:assignment)

//数据缓存路径
#define dataCachePath [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"dataCache"];
//图片缓存路径
#define imageCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"imageCache"]
// 设置颜色
#define SetColor(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]
#define SetAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
// 设置字体
#define YACSetFont(font)    [UIFont fontWithName:@".PingFang-SC-Light" size:(font)]
// 动态获取高度
#define IPHONE_STATUSBAR_HEIGHT         [UIApplication sharedApplication].statusBarFrame.size.height
#define IPHONE_HEIGHT_WITHOUTTOPBAR     [UIScreen mainScreen].bounds.size.height - 44 - IPHONE_STATUSBAR_HEIGHT
#define IPHONE_WIDTH                    [UIScreen mainScreen].bounds.size.width
#define IPHONE_HEIGHT                   [UIScreen mainScreen].bounds.size.height
//适配用
#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640.0f, 1136.0f), [[UIScreen mainScreen] currentMode].size) : NO)
#define IPHONE4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640.0f, 960.0f), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750.0f, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242.0f, 2208.0f), [[UIScreen mainScreen] currentMode].size) : NO)

// 获取屏幕宽度，高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define MainScreenRect       [UIScreen mainScreen].bounds
#define WS(object) __weak typeof(object) weakself = object;

/**获取APP信息*/
#define AppCurVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define AppCurName [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define AppCurVersionNum [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

/**获取手机信息*/
// 手机序列号
//#define IdentifierNumber [[UIDevice currentDevice] uniqueIdentifier] 已经被淘汰
// 手机别名： 用户定义的名称
#define UserPhoneName [[UIDevice currentDevice] name]
// 设备名称
#define DeviceName [[UIDevice currentDevice] systemName]
//手机系统版本
#define PhoneVersion [[UIDevice currentDevice] systemVersion]
// 手机型号
#define PhoneModel [[UIDevice currentDevice] model]
// 地方型号  （国际化区域名称）
#define LocalPhoneModel [[UIDevice currentDevice] localizedModel]


#endif /* Config_h */
