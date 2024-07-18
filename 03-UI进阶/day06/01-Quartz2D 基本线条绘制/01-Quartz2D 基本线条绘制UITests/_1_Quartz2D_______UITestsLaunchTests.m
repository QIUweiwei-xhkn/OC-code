//
//  _1_Quartz2D_______UITestsLaunchTests.m
//  01-Quartz2D 基本线条绘制UITests
//
//  Created by wei wei on 2024/7/9.
//

#import <XCTest/XCTest.h>

@interface _1_Quartz2D_______UITestsLaunchTests : XCTestCase

@end

@implementation _1_Quartz2D_______UITestsLaunchTests

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
