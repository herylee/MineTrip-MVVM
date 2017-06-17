//
//  MineTripLeftViewController.m
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/15.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MineTripLeftViewController.h"
#import "UIViewController+MineTripSliderViewController.h"
#import "MineTripNavigationController.h"
#import "MineTripNewsViewController.h"
#import "MineTripLeftViewModel.h"
#import "MineTripLeftTableViewCell.h"

@interface MineTripLeftViewController ()<UITableViewDelegate,UITableViewDataSource>
/**数据源*/
@property (nonatomic,strong) NSArray *dataSource;
/**背景图*/
@property (nonatomic,strong) UIImageView *backImageView;
/**头视图*/
@property (nonatomic,strong) UIImageView *headImageView;
/**菜单栏*/
@property (nonatomic,strong) UITableView *menuTableView;
@end

@implementation MineTripLeftViewController

#pragma mark - Lazy Load
- (UIImageView*)backImageView
{
    return MY_LAZY(_backImageView, ({
        UIImageView *backImageView = [[UIImageView alloc]init];
        backImageView.image = [UIImage imageNamed:@"view_bg"];
        backImageView.frame = self.view.bounds;
        backImageView.userInteractionEnabled = YES;
        backImageView;
    }));
}

- (UIImageView*)headImageView
{
    return MY_LAZY(_headImageView, ({
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cqyou"]];
        imageView.frame = CGRectMake(0,22,240, 80);
        imageView;
    }));
}

- (UITableView*)menuTableView
{
    return MY_LAZY(_menuTableView, ({
        CGRect tableFrame = (CGRect){0,102,240,350};
        UITableView *tableView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 44.f;
        tableView;
    }));
}

- (NSArray*)dataSource
{
    return MY_LAZY(_dataSource, ({
        NSArray *dataSource = [NSArray array];
        MineTripLeftViewModel *m1 = [[MineTripLeftViewModel alloc]initWithInfo:@"home" titleName:@"首页"];
        MineTripLeftViewModel *m2 = [[MineTripLeftViewModel alloc]initWithInfo:@"zuixin" titleName:@"最新消息"];
        MineTripLeftViewModel *m3 = [[MineTripLeftViewModel alloc]initWithInfo:@"shipingdongtai" titleName:@"视频动态"];
        MineTripLeftViewModel *m4 = [[MineTripLeftViewModel alloc]initWithInfo:@"zhoubianpeitao" titleName:@"周边配套"];
        MineTripLeftViewModel *m5 = [[MineTripLeftViewModel alloc]initWithInfo:@"jingxuanfuwu" titleName:@"精选服务"];
        MineTripLeftViewModel *m6 = [[MineTripLeftViewModel alloc]initWithInfo:@"more-setting" titleName:@"设置"];
        dataSource = @[m1,m2,m3,m4,m5,m6];
        dataSource;
    }));
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.backImageView];
    [self.backImageView addSubview:self.headImageView];
    [self.backImageView addSubview:self.menuTableView];
    [self.menuTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataSource && [self.dataSource count]) {
        return self.dataSource.count;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const ID = @"MineTripLeftTableViewCell";
    MineTripLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MineTripLeftTableViewCell" owner:self options:nil] firstObject];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    //自定义选中行颜色
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0.09 green:0.60 blue:0.65 alpha:1.00];
    
    if (self.dataSource && indexPath.row < [self.dataSource count]) {
        MineTripLeftViewModel *model = self.dataSource[indexPath.row];
        cell.title.text = model.title_name;
        cell.icon.image = [UIImage imageNamed:model.icon_name];
    }
    return cell;
}

#pragma mark - TableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineTripNewsViewController *vc = [[MineTripNewsViewController alloc]init];
    MineTripNavigationController *nav = [[MineTripNavigationController alloc]initWithRootViewController:vc];
    [[self sliderViewController] changeMainViewController:nav close:YES];
    
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
