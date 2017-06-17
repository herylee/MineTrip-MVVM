//
//  MineTripTests.m
//  MineTripTests
//
//  Created by ChangWingchit on 2017/6/11.
//  Copyright © 2017年 chit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MineTripNetWorking.h"
#import "Config.h"

@interface MineTripTests : XCTestCase

@property (nonatomic,strong) MineTripNetWorking *networking;

@end

@implementation MineTripTests

- (void)setUp {
    [super setUp];
    self.networking = [MineTripNetWorking share];
}

- (void)tearDown {
    [super tearDown];
}


- (void)testIntroductionRequest
{
    //测试参数
    
    //测试步骤
    __block BOOL complete = NO;
    self.networking.result = ^(id objc, NSError *error) {
        NSLog(@"%@",(NSDictionary*)objc);
        complete = YES;
    };
    [self.networking getIntroductionRequest];
    while (!complete) {
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.01, YES);
        NSLog(@"requesting");
    }
}

- (void)testZixunListRequest
{
   __block BOOL complete = NO;
   self.networking.result = ^(id objc, NSError *error) {
       NSLog(@"%@",(NSDictionary*)objc);
       complete = YES;
   };
   [self.networking getZixunListRequest];
    while (!complete) {
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0.01, YES);
        NSLog(@"requesting");
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
