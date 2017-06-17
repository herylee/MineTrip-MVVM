//
//  UIViewController+MineTripSliderViewController.m
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/15.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "UIViewController+MineTripSliderViewController.h"

@implementation UIViewController (MineTripSliderViewController)


- (MineTripSliderViewController *)sliderViewController
{
    UIViewController *viewcontroller = (UIViewController *)self.parentViewController;
    while (viewcontroller) {
        if ([viewcontroller isKindOfClass:[MineTripSliderViewController class]]) {
            return (MineTripSliderViewController *)viewcontroller;
        }else if (viewcontroller.parentViewController && viewcontroller.parentViewController!=viewcontroller){
            viewcontroller = (UIViewController *)viewcontroller.parentViewController;
        }else{
            return nil;
        }
    }
    return nil;
}


@end
