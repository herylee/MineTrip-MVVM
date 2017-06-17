//
//  MineTripNavigationController.m
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/15.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MineTripNavigationController.h"

@interface MineTripNavigationController ()

@end

@implementation MineTripNavigationController

+ (void)initialize{
    
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    
    [bar setBackgroundImage:[UIImage imageNamed:@"导航栏"] forBarMetrics:UIBarMetricsDefault];
    //设置导航条不透明
    bar.translucent = NO;
    // 设置导航条字体
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [bar setTitleTextAttributes:dict];
    // 把返回按钮变成白色
    bar.tintColor = [UIColor whiteColor];
    // 把返回按钮的文字移除
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
    // Position 位置
    [item setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - Life Cylcle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait; //返回竖屏
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
