//
//  _0_NSOperation_______UITestsLaunchTests.m
//  10-NSOperation操作依赖和监听UITests
//
//  Created by wei wei on 2024/7/20.
//

#import <XCTest/XCTest.h>

@interface _0_NSOperation_______UITestsLaunchTests : XCTestCase

@end

@implementation _0_NSOperation_______UITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
