//
//  NewFeatureViewController.m
//  MineShop
//
//  Created by ChangWingchit on 2017/6/5.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "NewFeatureViewController.h"
#import "NewFeatureCollectionViewCell.h"

@interface NewFeatureViewController ()<UICollectionViewDataSource>
/**记录上次偏差*/
@property (nonatomic, assign) CGFloat lastOffsetX;
/**记录图片*/
@property (nonatomic, weak) UIImageView *guideImageView;
/**
 *  底部大标题
 */
@property (nonatomic, weak) UIImageView *guideLargeTextImageView;
/**
 *  底部小标题
 */
@property (nonatomic, weak) UIImageView *guideSmallTextImageView;

@end

@implementation NewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";
#define MINESHOPBounds [UIScreen mainScreen].bounds

#pragma mark - init
- (instancetype)init{
    // 创建流水布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 行间距
    flowLayout.minimumLineSpacing = 0;
    // 每个item 之间的间距
    flowLayout.minimumInteritemSpacing = 0;
    
    // 设置每个cell 的尺寸
    flowLayout.itemSize = MINESHOPBounds.size;
    
    // 设置滚动方向 水平滚动
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    //    flowLayout.sectionInset = UIEdgeInsetsMake(100, 20, 30, 40);
    return [super initWithCollectionViewLayout:flowLayout];
}


#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

    [self.collectionView registerClass:[NewFeatureCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.view.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor yellowColor];
    
    // 设置分页
    self.collectionView.pagingEnabled = YES;
    // 取消弹簧效果
    self.collectionView.bounces = NO;
    // 取消滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    [self addImageView];
}

#pragma mark - PriVate Method
- (void)addImageView
{
    // guide1
    UIImageView *guideImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:guideImageView];
    guideImageView.x += 50;
    self.guideImageView = guideImageView;
    
    // guideLine
    UIImageView *guideLineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    [self.collectionView addSubview:guideLineImageView];
    guideLineImageView.x -= 150;
    
    // guideLargeText1
    UIImageView *guideLargeTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:guideLargeTextImageView];
    guideLargeTextImageView.center = CGPointMake(self.collectionView.width * 0.5f, self.collectionView.height * 0.7);
    self.guideLargeTextImageView = guideLargeTextImageView;
    
    // guideSmallText1
    UIImageView *guideSmallTextImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView addSubview:guideSmallTextImageView];
    guideSmallTextImageView.center = CGPointMake(self.collectionView.width * 0.5f, self.collectionView.height * 0.8);
    self.guideSmallTextImageView = guideSmallTextImageView;
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 平移一个偏差
    // 当前偏差
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 计算页码
    NSInteger page = offsetX / scrollView.width + 1;
    
    // 换图片
    NSString *name = [NSString stringWithFormat:@"guide%ld",page];
    UIImage *image = [UIImage imageNamed:name];
    self.guideImageView.image = image;
    
    // 大标题
    NSString *largeTextname = [NSString stringWithFormat:@"guideLargeText%ld",page];
    UIImage *largeTextimage = [UIImage imageNamed:largeTextname];
    self.guideLargeTextImageView.image = largeTextimage;
    
    // 小标题
    NSString *smallTextname = [NSString stringWithFormat:@"guideSmallText%ld",page];
    UIImage *smallTextimage = [UIImage imageNamed:smallTextname];
    self.guideSmallTextImageView.image = smallTextimage;
    
    // 偏差值
    CGFloat del = offsetX - self.lastOffsetX;
    
    self.guideImageView.x += del * 2;
    self.guideLargeTextImageView.x += del * 2;
    self.guideSmallTextImageView.x += del * 2;
    
    [UIView animateWithDuration:0.25f animations:^{
        self.guideImageView.x -= del;
        self.guideLargeTextImageView.x -= del;
        self.guideSmallTextImageView.x -= del;
    }];
    
    // 记录上次偏差
    self.lastOffsetX = offsetX;
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//#define MINESHOPPage 4
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewFeatureCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // 添加背景图片
    NSString *imageName = [NSString stringWithFormat:@"guide%ldBackground",indexPath.item + 1];
    
    cell.myImage = [UIImage imageNamed:imageName];
    
    [cell setIndexPath:indexPath count:4];
    
    return cell;
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
