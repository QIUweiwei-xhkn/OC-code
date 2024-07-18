//
//  _4_UIImageView_frame__UITestsLaunchTests.m
//  04-UIImageView的frame设置UITests
//
//  Created by wei wei on 2023/12/31.
//

#import <XCTest/XCTest.h>

@interface _4_UIImageView_frame__UITestsLaunchTests : XCTestCase

@end

@implementation _4_UIImageView_frame__UITestsLaunchTests

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
