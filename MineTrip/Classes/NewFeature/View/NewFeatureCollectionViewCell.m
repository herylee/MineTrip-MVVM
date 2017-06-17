//
//  NewFeatureCollectionViewCell.m
//  MineShop
//
//  Created by ChangWingchit on 2017/6/5.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "NewFeatureCollectionViewCell.h"
#import "MineTripSliderViewController.h"

@interface NewFeatureCollectionViewCell ()
@property (nonatomic, strong) UIImageView *bgImageView;
/**
 *  立即体验按钮
 */
@property (nonatomic, strong) UIButton *startBtn;
@end

@implementation NewFeatureCollectionViewCell

- (UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn = [[UIButton alloc] init];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        
        [_startBtn sizeToFit];
        
        // 一定要在按钮有尺寸的时候,在调整位置
        _startBtn.center = CGPointMake(self.contentView.width * 0.5f, self.contentView.height * 0.9f);
        
        
        [_startBtn addTarget:self action:@selector(startBtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:_startBtn];
    }
    return _startBtn;
}

// 开始按钮点击调用的方法
- (void)startBtnOnclick:(UIButton *)button{
    NSLog(@"%@",button);
    // 切换控制器
    /*
     1.push
     2.tabBarVc
     3.modal
     新特性界面: 当有版本更新的时候才显示, 没有版本更新的时候就不显示,只显示一次
     切换的时候新特性界面一般不要
     切换跟控制器
     */
   
    // 切换跟控制器
//    MineTripkeyWindow.rootViewController = vc;
}

- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_bgImageView];
    }
    return _bgImageView;
}

- (void)setMyImage:(UIImage *)myImage
{
    _myImage = myImage;
    // 设置image
    self.bgImageView.image = myImage;
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count{
    // 当时最后一个cell的时候,就添加立即体验按钮
    if (indexPath.item + 1 == count) { // 最后一个cell
        // 添加立即体验按钮
        self.startBtn.hidden = NO;
    }else{ // 不是最后一个cell
        // 隐藏立即体验按钮
        self.startBtn.hidden = YES;
    }
}

@end
