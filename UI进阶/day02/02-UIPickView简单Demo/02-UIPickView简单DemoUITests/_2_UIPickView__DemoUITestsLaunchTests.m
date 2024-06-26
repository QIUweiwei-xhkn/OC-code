//
//  _2_UIPickView__DemoUITestsLaunchTests.m
//  02-UIPickView简单DemoUITests
//
//  Created by wei wei on 2024/5/10.
//

#import <XCTest/XCTest.h>

@interface _2_UIPickView__DemoUITestsLaunchTests : XCTestCase

@end

@implementation _2_UIPickView__DemoUITestsLaunchTests

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
