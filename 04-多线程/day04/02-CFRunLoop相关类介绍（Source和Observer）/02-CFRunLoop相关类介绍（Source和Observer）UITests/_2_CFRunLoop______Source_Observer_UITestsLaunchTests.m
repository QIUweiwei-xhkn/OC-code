//
//  _2_CFRunLoop______Source_Observer_UITestsLaunchTests.m
//  02-CFRunLoop相关类介绍（Source和Observer）UITests
//
//  Created by wei wei on 2024/7/22.
//

#import <XCTest/XCTest.h>

@interface _2_CFRunLoop______Source_Observer_UITestsLaunchTests : XCTestCase

@end

@implementation _2_CFRunLoop______Source_Observer_UITestsLaunchTests

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
