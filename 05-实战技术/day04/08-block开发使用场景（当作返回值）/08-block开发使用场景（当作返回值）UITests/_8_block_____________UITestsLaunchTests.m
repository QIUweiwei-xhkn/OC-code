//
//  _8_block_____________UITestsLaunchTests.m
//  08-block开发使用场景（当作返回值）UITests
//
//  Created by wei wei on 2024/8/6.
//

#import <XCTest/XCTest.h>

@interface _8_block_____________UITestsLaunchTests : XCTestCase

@end

@implementation _8_block_____________UITestsLaunchTests

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
