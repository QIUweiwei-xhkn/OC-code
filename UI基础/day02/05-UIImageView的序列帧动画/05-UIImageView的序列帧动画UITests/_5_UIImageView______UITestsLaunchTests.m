//
//  _5_UIImageView______UITestsLaunchTests.m
//  05-UIImageView的序列帧动画UITests
//
//  Created by wei wei on 2024/1/26.
//

#import <XCTest/XCTest.h>

@interface _5_UIImageView______UITestsLaunchTests : XCTestCase

@end

@implementation _5_UIImageView______UITestsLaunchTests

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
