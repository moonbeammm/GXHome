//
//  GXAttributesParserTests.m
//  GXHomeTests
//
//  Created by sgx on 2018/1/18.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+AttributeParser.h"

@interface GXAttributesParserTests : XCTestCase

@end

@implementation GXAttributesParserTests

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
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSDictionary *dict1 = @{
                           @"user":@{
                                   @"avart":@"http://www.baidu.com"
                                   }
                           };
    NSString *parse1 = [dict1 parserWithKey:@"user.avart"];
    XCTAssert([parse1 isEqualToString:@"http://www.baidu.com"],@"出错啦");
    NSDictionary *dict2 = @{
                           @"user":@{
                                   @"avart1":@"http://www.baidu.com"
                                   }
                           };
    NSString *parse2 = [dict2 parserWithKey:@"user.avart"];
    XCTAssert(!parse2,@"出错啦");
    NSDictionary *dict3 = @{
                           @"user":@[
                                   @{
                                       @"avart":@"http://www.baidu.com"
                                       }
                                   ]
                           };
    NSString *parse3 = [dict3 parserWithKey:@"user.avart"];
    XCTAssert(!parse3,@"出错啦");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
