//
//  MineTripLeftViewModel.m
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/17.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MineTripLeftViewModel.h"

@implementation MineTripLeftViewModel

- (instancetype)initWithInfo:(NSString *)iconName titleName:(NSString *)titleName
{
    if (self = [super init]) {
        self.icon_name = iconName;
        self.title_name = titleName;
    }
    return self;
}

@end
