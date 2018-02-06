//
//  GXExpressionTests.m
//  GXHomeTests
//
//  Created by sgx on 2018/2/5.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BBPhoneExpression.h"

@interface GXExpressionTests : XCTestCase

@property (nonatomic, strong) NSDictionary *result;

@end

@implementation GXExpressionTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.result = @{
                    @"user":@{
                            @"avart":@"http://www.baidu.com",
                            @"play":@"120000"
                            },
                    @"stat":@[@"关注",@"未关注"],
                    @"following":@0,
                    @"tags":@[
                            @{@"name":@"sunguangxin"},
                            @{@"name":@"yangting"}
                            ]
                    };
}

/// 测试key支持哪些格式
- (void)testExpressionStandardExample {
    NSString *result = nil;
    NSString *key = nil;
    
    // 支持字典
    key = @"${user.avart}";
    result = (id)[BBPhoneExpression expressionWithKey:key object:self.result];
    XCTAssert([result isEqualToString:@"http://www.baidu.com"],@"支持");
    
    // 支持数组
    key = @"${tags[0]}";
    result = (id)[BBPhoneExpression expressionWithKey:key object:self.result];
    XCTAssert([result isKindOfClass:[NSDictionary class]],@"支持");
    
    // 支持 字典 套 数组 套 字典
    key = @"${tags[0].name}";
    result = (id)[BBPhoneExpression expressionWithKey:key object:self.result];
    XCTAssert([result isEqualToString:@"sunguangxin"],@"支持");
}

/// 测试三位运算符
- (void)testIFExample {
    NSString *result = nil;
    NSString *key = nil;
    
    key = @"@{${following}?${stat[0]}:${stat[1]}}";
    result = (id)[BBPhoneExpression expressionWithKey:key object:self.result];
    XCTAssert([result isEqualToString:@"未关注"],@"支持");
}

/// 测试拼接
- (void)testAppendExample {
    NSString *result = nil;
    NSString *key = nil;
    
    key = @"${user.play.bili_transform}+人观看";
    result = (id)[BBPhoneExpression expressionWithKey:key object:self.result];
    XCTAssert([result isEqualToString:@"12.0万人观看"],@"支持");
}

- (void)testConstExample {
    NSString *result = nil;
    NSString *key = nil;
    
    key = @"关注";
    result = (id)[BBPhoneExpression expressionWithKey:key object:self.result];
    XCTAssert([result isEqualToString:@"关注"],@"支持");
}

@end
