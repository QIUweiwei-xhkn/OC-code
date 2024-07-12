//
//  _4_position_archorPointUITestsLaunchTests.m
//  04-position和archorPointUITests
//
//  Created by wei wei on 2024/7/11.
//

#import <XCTest/XCTest.h>

@interface _4_position_archorPointUITestsLaunchTests : XCTestCase

@end

@implementation _4_position_archorPointUITestsLaunchTests

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
