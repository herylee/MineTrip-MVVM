//
//  NewFeatureCollectionViewCell.h
//  MineShop
//
//  Created by ChangWingchit on 2017/6/5.
//  Copyright © 2017年 chit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewFeatureCollectionViewCell : UICollectionViewCell

/**
 *  背景图片
 */
@property (nonatomic, strong) UIImage *myImage;

- (void)setIndexPath:(NSIndexPath *)indexPath count:(NSInteger)count;

@end
