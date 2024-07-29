//
//  _1______MIMETypeUITestsLaunchTests.m
//  01-获得文件的MIMETypeUITests
//
//  Created by wei wei on 2024/7/26.
//

#import <XCTest/XCTest.h>

@interface _1______MIMETypeUITestsLaunchTests : XCTestCase

@end

@implementation _1______MIMETypeUITestsLaunchTests

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
