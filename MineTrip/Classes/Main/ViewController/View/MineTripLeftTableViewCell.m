//
//  MineTripTableViewCell.m
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/15.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MineTripLeftTableViewCell.h"

@implementation MineTripLeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
