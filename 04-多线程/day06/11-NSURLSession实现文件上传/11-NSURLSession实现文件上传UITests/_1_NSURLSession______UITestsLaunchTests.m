//
//  _1_NSURLSession______UITestsLaunchTests.m
//  11-NSURLSession实现文件上传UITests
//
//  Created by wei wei on 2024/7/29.
//

#import <XCTest/XCTest.h>

@interface _1_NSURLSession______UITestsLaunchTests : XCTestCase

@end

@implementation _1_NSURLSession______UITestsLaunchTests

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
