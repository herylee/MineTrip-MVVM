//
//  MineTripLeftViewModel.h
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/17.
//  Copyright © 2017年 chit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineTripLeftViewModel : NSObject

@property (nonatomic,strong) NSString *icon_name;
@property (nonatomic,strong) NSString *title_name;

- (instancetype)initWithInfo:(NSString*)iconName titleName:(NSString*)titleName;

@end
