//
//  _6_NSURLSessionDownloadTask______block_UITestsLaunchTests.m
//  06-NSURLSessionDownloadTask大文件下载（block）UITests
//
//  Created by wei wei on 2024/7/26.
//

#import <XCTest/XCTest.h>

@interface _6_NSURLSessionDownloadTask______block_UITestsLaunchTests : XCTestCase

@end

@implementation _6_NSURLSessionDownloadTask______block_UITestsLaunchTests

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
