//
//  _1_IOS9______UITestsLaunchTests.m
//  01-IOS9新特性之泛型UITests
//
//  Created by wei wei on 2024/7/31.
//

#import <XCTest/XCTest.h>

@interface _1_IOS9______UITestsLaunchTests : XCTestCase

@end

@implementation _1_IOS9______UITestsLaunchTests

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
