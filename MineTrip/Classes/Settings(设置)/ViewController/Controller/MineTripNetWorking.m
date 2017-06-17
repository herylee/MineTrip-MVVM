//
//  MineTripNetWorking.m
//  MineTrip
//
//  Created by ChangWingchit on 2017/6/11.
//  Copyright © 2017年 chit. All rights reserved.
//

#import "MineTripNetWorking.h"
#import "CommonUtils.h"

@implementation MineTripNetWorking

#pragma mark - INIT
/**初始化网络请求*/
+ (MineTripNetWorking *)share
{
    static MineTripNetWorking *g_request = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_request = [[MineTripNetWorking alloc]init];
    });
    return g_request;
}

/**初始化任务*/
- (NSMutableArray*)tasks
{
    static NSMutableArray *g_tasks = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        g_tasks = @[].mutableCopy;
    });
    return g_tasks;
}

#pragma mark - REQUEST
/**注册接口*/
- (void)postRegisterRequest:(NSString*)uuid
                 phonemodel:(NSString*)phonemodel
                   username:(NSString*)username
                   password:(NSString*)password
                        key:(NSString*)key
{
    NSString *url = [MineTrip_URL_RegistOrLogin stringByAppendingString:Regist_URL];
    NSDictionary *parameters = @{@"a":uuid,
                                 @"b":phonemodel,
                                 @"c":username,
                                 @"d":password,
                                 @"key":key};
    [self postAfNetWoringRequestWithURLAndParameters:url parameters:parameters];
}

/**登录接口*/
- (void)postLoginRequest:(NSString*)uuid
              phonemodel:(NSString*)phonemodel
                username:(NSString*)username
                password:(NSString*)password
                     key:(NSString*)key
{
    NSString *url = [MineTrip_URL_RegistOrLogin stringByAppendingString:Login_URL];
    NSDictionary *parameters = @{@"a":uuid,
                                 @"b":phonemodel,
                                 @"c":username,
                                 @"d":password,
                                 @"key":key};
    [self postAfNetWoringRequestWithURLAndParameters:url parameters:parameters];
}

/**长寿景点接口*/
- (void)postScenicListRequest:(int)scenicid page:(int)page
{
    NSString *url = [MineTrip_URL stringByAppendingString:ScenicList_URL];
    NSDictionary *parameters = @{@"a":@(scenicid),
                                 @"b":@(page)};
    [self postAfNetWoringRequestWithURLAndParameters:url parameters:parameters];
}

/**长寿景点详情接口*/
- (void)postScenicDetailRequest:(int)scenic_detail_id
{
    NSString *url = [MineTrip_URL stringByAppendingString:ScenicDetail_URL];
    NSDictionary *parameters = @{@"a":@(scenic_detail_id)};
    [self postAfNetWoringRequestWithURLAndParameters:url parameters:parameters];
}

/**消息接口*/
- (void)postNewsListRequest:(int)page
{
    NSString *url = [MineTrip_URL stringByAppendingString:NewsList_URL];
    NSDictionary *parameters = @{@"a":@(page)};
    [self postAfNetWoringRequestWithURLAndParameters:url parameters:parameters];
}

/**视频接口*/
- (void)postVideolistRequest:(int)video_type page:(int)page
{
    NSString *url = [MineTrip_URL stringByAppendingString:Videolist_URL];
    NSDictionary *parameters = @{@"a":@(video_type),
                                 @"b":@(page)};
    [self postAfNetWoringRequestWithURLAndParameters:url parameters:parameters];
}

/**周边接口*/
- (void)postSurroundingListRequest:(int)surrounding_type page:(int)page
{
    NSString *url = [MineTrip_URL stringByAppendingString:SurroundingList_URL];
    NSDictionary *parameters = @{@"a":@(surrounding_type),
                                 @"b":@(page)};
    [self postAfNetWoringRequestWithURLAndParameters:url parameters:parameters];
}

/**周边详情内容接口*/
- (void)postSurroundingDetailRequest:(int)surrounding_detail_id
{
    NSString *url = [MineTrip_URL stringByAppendingString:SurroundingDetail_URL];
    NSDictionary *parameters = @{@"a":@(surrounding_detail_id)};
    [self postAfNetWoringRequestWithURLAndParameters:url parameters:parameters];
}

/**景区咨询接口*/
- (void)getZixunListRequest
{
    NSString *url = [MineTrip_URL stringByAppendingString:ZixunList_URL];
    [self getAfNetWorkingRequestWithURLAndParameters:url parameters:nil];
}

/**投诉建议接口*/
- (void)postComplaintRequest:(NSString*)username phonenumber:(NSString*)phonenumber complaint:(NSString*)complaint
{
    NSString *url = [MineTrip_URL stringByAppendingString:Complaint_URL];
    NSDictionary *parameters = @{@"a":username,
                                 @"b":phonenumber,
                                 @"c":complaint};
    [self postAfNetWoringRequestWithURLAndParameters:url parameters:parameters];
}

/**长寿概况接口*/
- (void)getIntroductionRequest
{
    NSString *url = [MineTrip_URL stringByAppendingString:Introduction_URL];
    [self getAfNetWorkingRequestWithURLAndParameters:url parameters:nil];
}

#pragma mark - Private Method
/**AFNETWORKING-POST请求*/
- (void)postAfNetWoringRequestWithURLAndParameters:(NSString*)url parameters:(NSDictionary*)parameters
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", @"text/plain", nil];
    NSURLSessionDataTask *task = [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //可拓展(获取cookie)
        [self getAndSaveCookie:task andUrl:url];

        [[self tasks]removeObject:task];
        //数据请求成功后，返回 responseObject 结果集
        self.result(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //数据请求失败，返回错误信息原因 error
        NSLog(@"ERROR: %@", error);
        [[self tasks]removeObject:task];
        self.result(nil, error);
    }];
    [self.tasks addObject:task];
}

/**AFNETWORKING-GET请求*/
- (void)getAfNetWorkingRequestWithURLAndParameters:(NSString*)url parameters:(NSDictionary*)paramters
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", @"text/plain", nil];
    NSURLSessionDataTask *task = [manager GET:url parameters:paramters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //可拓展(获取cookie)
        [self getAndSaveCookie:task andUrl:url];
        
        [[self tasks]removeObject:task];
        //数据请求成功后，返回 responseObject 结果集
        self.result(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //数据请求失败，返回错误信息原因 error
        NSLog(@"ERROR: %@", error);
        [[self tasks]removeObject:task];
        self.result(nil, error);
    }];
    [self.tasks addObject:task];
}

#pragma mark - Method
/**取消所有网络请求*/
- (void)cancelALLRequest
{
    @synchronized (self) {
        [[self tasks] enumerateObjectsUsingBlock:^(NSURLSessionTask * _Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task isKindOfClass:[NSURLSessionDataTask class]]) {
                [task cancel];
            }
        }];
        [self.tasks removeAllObjects];
    }
}

/**取消指定网络请求*/
- (void)cancelRequestWithURL:(NSString *)url
{
    if (url == nil) {
        return;
    }
    
    @synchronized(self) {
        [[self tasks] enumerateObjectsUsingBlock:^(NSURLSessionTask * _Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([task isKindOfClass:[NSURLSessionTask class]]
                && [task.currentRequest.URL.absoluteString hasSuffix:url]) {
                [task cancel];
                [[self tasks] removeObject:task];
                return;
            }
        }];
    };
}

#pragma mark  - 获取并保存cookie
/**获取并保存cookie*/
- (void)getAndSaveCookie:(NSURLSessionDataTask *)task andUrl:(NSString *)url
{
    //    NSLog(@"=============获取cookie==============");
    //获取cookie
    NSDictionary *headers = [(NSHTTPURLResponse *)task.response allHeaderFields];
    //    NSLog(@"headers:%@",headers);
    NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:headers forURL:[NSURL URLWithString:url]];
    /*
     * 把cookie进行归档并转换为NSData类型
     */
    if (cookies && cookies.count != 0) {
        
        NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
        //存储归档后的cookie
        [CommonUtils saveValueInUD:cookiesData forKey:@"UserCookie"];
    }
}

#pragma mark - 删除cookie
/**删除cookie*/
- (void)deleteCookieWithLoginOut
{
    NSData *cookiesData = [NSData data];
    [CommonUtils saveValueInUD:cookiesData forKey:@"UserCookie"];
    
    //    NSLog(@"============删除cookie===============");
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    
    //删除cookie
    for (NSHTTPCookie *tempCookie in cookies) {
        [cookieStorage deleteCookie:tempCookie];
    }
    
    //把cookie打印出来，检测是否已经删除
    NSArray *cookiesAfterDelete = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    for (NSHTTPCookie *tempCookie in cookiesAfterDelete) {
        NSLog(@"cookieAfterDelete: %@", tempCookie);
    }
}

#pragma mark - 重新设置cookie
/**重新获取cookie*/
- (void)setUpCoookie
{
    //    NSLog(@"============再取出保存的cookie重新设置cookie===============");
    //取出保存的cookie
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //对取出的cookie进行反归档处理
    NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:[userDefaults objectForKey:@"UserCookie"]];
    
    if (cookies && cookies.count != 0) {
                NSLog(@"有cookie");
        //设置cookie
        NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (id cookie in cookies) {
            [cookieStorage setCookie:(NSHTTPCookie *)cookie];
        }
    }else{
                NSLog(@"无cookie");
    }
}


@end
