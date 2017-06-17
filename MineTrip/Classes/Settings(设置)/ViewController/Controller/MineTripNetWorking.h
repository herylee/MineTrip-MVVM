//
//  MineTripNetWorking.h
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/11.
//  Copyright © 2017年 chit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^RequestResult)(id objc,NSError *error);

@interface MineTripNetWorking : NSObject

/**网络请求结果*/
@property (nonatomic,strong) RequestResult result;
/**网络请求任务*/
@property (nonatomic,strong) NSMutableArray *tasks;

/**初始化网络请求*/
+ (MineTripNetWorking *)share;

/**取消所有网络请求*/
- (void)cancelALLRequest;

/**取消指定网络请求*/
- (void)cancelRequestWithURL:(NSString *)url;

/**注册接口*/
- (void)postRegisterRequest:(NSString*)uuid
                 phonemodel:(NSString*)phonemodel
                   username:(NSString*)username
                   password:(NSString*)password
                        key:(NSString*)key;

/**登录接口*/
- (void)postLoginRequest:(NSString*)uuid
              phonemodel:(NSString*)phonemodel
                username:(NSString*)username
                password:(NSString*)password
                     key:(NSString*)key;

/**长寿景点接口*/
- (void)postScenicListRequest:(int)scenicid page:(int)page;

/**长寿景点详情接口*/
- (void)postScenicDetailRequest:(int)scenic_detail_id;

/**消息接口*/
- (void)postNewsListRequest:(int)page;

/**视频接口*/
- (void)postVideolistRequest:(int)video_type page:(int)page;

/**周边接口*/
- (void)postSurroundingListRequest:(int)surrounding_type page:(int)page;

/**周边详情内容接口*/
- (void)postSurroundingDetailRequest:(int)surrounding_detail_id;

/**景区咨询接口*/
- (void)getZixunListRequest;

/**投诉建议接口*/
- (void)postComplaintRequest:(NSString*)username
                 phonenumber:(NSString*)phonenumber
                   complaint:(NSString*)complaint;

/**长寿概况接口*/
- (void)getIntroductionRequest;


@end
