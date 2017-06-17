//
//  MineTripSliderViewController.h
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/15.
//  Copyright © 2017年 chit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineTripSliderViewController : UIViewController

@property (nonatomic, strong, readonly) UIViewController *mainViewController;
@property (nonatomic, strong, readonly) UIViewController *leftViewController;
@property (nonatomic, strong, readonly) UIViewController *rightViewController;

@property (nonatomic, strong, readonly) UINavigationController *sliderNavigationController; // push所需要的navigationController 只能由mainVC 提供

/**
 初始化侧滑菜单控制器
 
 @param mainVC  默认显示的界面，不可为空
 @param leftVC  左边界面
 @param rightVC 右边界面
 
 @return 带侧滑菜单的控制器
 */
- (instancetype)initWithMainViewController:(UIViewController *)mainVC
                        leftViewController:(UIViewController *)leftVC
                       rightViewController:(UIViewController *)rightVC;

/**根据左视图切换控制器*/
- (void)changeMainViewController:(UIViewController *)newMainController close:(BOOL)close;
/**显示左边视图*/
- (void)showLeft;
/**隐藏左边视图*/
- (void)hideLeft;
/**显示右边视图*/
- (void)showRight;
/**隐藏右边视图*/
- (void)hideRight;

@end
