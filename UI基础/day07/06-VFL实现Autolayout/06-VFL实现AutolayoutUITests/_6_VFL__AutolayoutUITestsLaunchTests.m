//
//  _6_VFL__AutolayoutUITestsLaunchTests.m
//  06-VFL实现AutolayoutUITests
//
//  Created by wei wei on 2024/2/17.
//

#import <XCTest/XCTest.h>

@interface _6_VFL__AutolayoutUITestsLaunchTests : XCTestCase

@end

@implementation _6_VFL__AutolayoutUITestsLaunchTests

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
