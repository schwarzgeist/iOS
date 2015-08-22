//
//  Calculator_ObjectiveCTests.m
//  Calculator-ObjectiveCTests
//
//  Created by Anthony Walker on 8/22/15.
//  Copyright (c) 2015 Anthony.Walker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Calculator_ObjectiveCTests : XCTestCase

@end

@implementation Calculator_ObjectiveCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
