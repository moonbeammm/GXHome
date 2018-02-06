//
//  BBPhoneExpression.m
//  BBPhone
//
//  Created by bilibili on 2018/1/21.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "BBPhoneExpression.h"

@interface BBPhoneExpression ()

+ (BBPhoneExpression *)expressionWithString:(NSString *)string;
- (id)resultWithObject:(id)object;

@end

@interface BBPhoneConstExpression : BBPhoneExpression

@property (nonatomic, copy) NSString *value;

@end

@interface BBPhoneVarExpression : BBPhoneExpression

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) NSString *key;
@property (nonatomic, strong) BBPhoneExpression *nextExpression;

@end

@interface BBPhoneConditionExpression : BBPhoneExpression

@property (nonatomic, strong) BBPhoneExpression *conditionExpression;
@property (nonatomic, strong) BBPhoneExpression *trueExpression;
@property (nonatomic, strong) BBPhoneExpression *falseExpression;

@end

@interface BBPhoneStringTool : NSObject

+ (NSString *)textFromCount:(NSInteger)count;
+ (NSString *)durationStringFromDuration:(NSInteger)duration;
+ (NSString *)time:(NSInteger)time;
+ (NSString *)bangumiIndexFromIndex:(NSString *)index;

@end

/**************************************************************************
                                父类 总入口
 *************************************************************************/

@implementation BBPhoneExpression

+ (id)expressionWithKey:(NSString *)key object:(id)object
{
    if ([key containsString:@"+"]) {
        NSArray *components = [key componentsSeparatedByString:@"+"];
        NSString *temp = @"";
        for (NSString *oneKey in components) {
            BBPhoneExpression *expression = [[self class] expressionWithString:oneKey];
            id oneValue = [expression resultWithObject:object];
            if (!oneValue) {
                return nil;
            }
            temp = [temp stringByAppendingString:oneValue];
        }
        return temp;
    } else {
        BBPhoneExpression *expression = [[self class] expressionWithString:key];
        id oneValue = [expression resultWithObject:object];
        return oneValue;
    }
}

+ (BBPhoneExpression *)expressionWithString:(NSString *)string {
    BBPhoneExpression *expression = nil;
    if (string && string.length > 0) {
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if (string.length > 3) {
            if ([string hasPrefix:@"@{"]) {
                expression = [BBPhoneConditionExpression expressionWithString:string];
            } else if ([string hasPrefix:@"${"]) {
                expression = [BBPhoneVarExpression expressionWithString:string];
            }
        }
    }
    if (!expression) {
        expression = [BBPhoneConstExpression expressionWithString:string];
    }
    return expression;
}

- (id)resultWithObject:(id)object {
    /// 子类覆写
    NSAssert(NO, @"你调用父类啦.只能调用子类的这个方法!\n");
    return nil;
}

@end

/**************************************************************************
                      常量表达式 如: 关注
 *************************************************************************/

@implementation BBPhoneConstExpression

+ (BBPhoneExpression *)expressionWithString:(NSString *)string
{
    BBPhoneConstExpression *expression = [BBPhoneConstExpression new];
    expression.value = string;
    return expression;
}

- (id)resultWithObject:(id)object
{
    return self.value;
}

@end

/**************************************************************************
                    变量表达式 如: ${user.name}
 *************************************************************************/

@implementation BBPhoneVarExpression

+ (BBPhoneExpression *)expressionWithString:(NSString *)string
{
    BBPhoneVarExpression *expression = nil;
    if ([string hasPrefix:@"${"] && [string hasSuffix:@"}"]) {
        string = [string substringWithRange:NSMakeRange(2, string.length - 3)];
        string = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if (string.length > 0) {
            if (![string hasPrefix:@"["]) {/// prefix为[ 那就是取数组
                string = [@"." stringByAppendingString:string];
            }
            expression = [self private_ExpressionWithString:string];
        }
    }
    return expression;
}

+ (BBPhoneVarExpression *)private_ExpressionWithString:(NSString *)string
{
    static NSCharacterSet *nextCharacterSet = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        nextCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"[."];
    });
    BBPhoneVarExpression *expression = nil;
    if ([string hasPrefix:@"["]) {
        NSRange range = [string rangeOfString:@"]"];
        if (range.location != NSNotFound) {
            NSString *indexString = [string substringWithRange:NSMakeRange(1, range.location - 1)];
            expression = [BBPhoneVarExpression new];
            expression.index = [indexString integerValue];
            string = [string substringFromIndex:range.location + 1];
        } else {
            string = nil;
        }
    } else if ([string hasPrefix:@"."]) {
        NSRange range = [string rangeOfCharacterFromSet:nextCharacterSet options:0 range:NSMakeRange(1, string.length - 1)];
        if (range.location != NSNotFound) {
            NSString *key = [string substringWithRange:NSMakeRange(1, range.location - 1)];
            expression = [BBPhoneVarExpression new];
            expression.key = key;
            string = [string substringFromIndex:range.location];
        } else {
            expression = [BBPhoneVarExpression new];
            expression.key = [string substringFromIndex:1];
            string = nil;
        }
    }
    if (expression && string && string.length > 0) {
        expression.nextExpression = [self private_ExpressionWithString:string];
    }
    return expression;
}

- (instancetype)init
{
    if (self = [super init]) {
        _index = -1;
    }
    return self;
}

- (id)resultWithObject:(id)object
{
    if (object) {
        id nextObject = nil;
        if (self.index >= 0 && [object isKindOfClass:[NSArray class]]) {
            NSArray *array = (NSArray *)object;
            if (self.index < array.count) {
                nextObject = [array objectAtIndex:self.index];
            }
        } else if (self.key && self.key.length > 0 && [object isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dict =(NSDictionary *)object;
            nextObject = [dict objectForKey:self.key];
        } else {
            if ([self.key isEqualToString:@"bili_transform"]) {
                nextObject = [BBPhoneStringTool textFromCount:[object integerValue]];
            }
        }
        if (self.nextExpression) {
            return [self.nextExpression resultWithObject:nextObject];
        } else {
            return nextObject;
        }
    }
    return nil;
}

@end

/**************************************************************************
                三元表达式 如: @{${follow}?关注:未关注}
 *************************************************************************/

@implementation BBPhoneConditionExpression

+ (BBPhoneExpression *)expressionWithString:(NSString *)string
{
    BBPhoneConditionExpression *expression = nil;
    if ([string hasPrefix:@"@{"] && [string hasSuffix:@"}"]) {
        string = [string substringWithRange:NSMakeRange(2, string.length - 3)];
        NSRange range1 = [string rangeOfString:@"?"];
        NSRange range2 = [string rangeOfString:@":"];
        if (range1.location != NSNotFound && range2.location != NSNotFound && range2.location > range1.location) {
            NSString *conditionString = [string substringToIndex:range1.location];
            NSString *trueString = [string substringWithRange:NSMakeRange(range1.location + 1, range2.location - range1.location - 1)];
            NSString *falseString = [string substringFromIndex:range2.location + 1];
            BBPhoneExpression *conditionExpression = [BBPhoneExpression expressionWithString:conditionString];
            BBPhoneExpression *trueExpression = [BBPhoneExpression expressionWithString:trueString];
            BBPhoneExpression *falseExpression = [BBPhoneExpression expressionWithString:falseString];
            if (conditionExpression && trueExpression && falseExpression) {
                expression = [BBPhoneConditionExpression new];
                expression.conditionExpression = conditionExpression;
                expression.trueExpression = trueExpression;
                expression.falseExpression = falseExpression;
            }
        }
    }
    return expression;
}

- (id)resultWithObject:(id)object
{
    if (object && ([object isKindOfClass:[NSDictionary class]] || [object isKindOfClass:[NSArray class]])) {
        id conditionObject = [self.conditionExpression resultWithObject:object];

        if (conditionObject) {
            if ([conditionObject isKindOfClass:[NSString class]]
                && [(NSString *)conditionObject length] > 0
                && [(NSString *)conditionObject isEqualToString:@"false"]) {
                return [self.falseExpression resultWithObject:object];
            } else if ([conditionObject respondsToSelector:@selector(boolValue)] && ![conditionObject boolValue]) {
                return [self.falseExpression resultWithObject:object];
            } else {
                return [self.trueExpression resultWithObject:object];
            }
        } else {
            return [self.falseExpression resultWithObject:object];
        }
    }
    return nil;
}

@end

/**************************************************************************
                                帮助类
 *************************************************************************/

@implementation BBPhoneStringTool

+ (NSString *)textFromCount:(NSInteger)count
{
    if (count >= 100000000) {
        return [NSString stringWithFormat:@"%.1f亿",count/100000000.f];
    }
    if (count >= 10000) {
        return [NSString stringWithFormat:@"%.1f万",count/10000.f];
    }
    if (count > 0) {
        return [NSString stringWithFormat:@"%zd", count];
    }
    return @"-";
}

+ (NSString *)durationStringFromDuration:(NSInteger)duration
{
    if (duration <= 0) {
        return @"";
    }
    NSInteger h = duration / 3600;
    NSInteger m = (duration % 3600) / 60;
    NSInteger s = (duration % 3600) % 60;
    if (h > 0) {
        return [NSString stringWithFormat:@"%@:%@:%@", [[self class] time:h], [[self class] time:m], [[self class] time:s]];
    } else {
        return [NSString stringWithFormat:@"%@:%@", [[self class] time:m], [[self class] time:s]];
    }
}

+ (NSString *)time:(NSInteger)time
{
    if (time < 10) {
        return [NSString stringWithFormat:@"0%zd", time];
    }
    return [NSString stringWithFormat:@"%zd", time];
}

+ (NSString *)bangumiIndexFromIndex:(NSString *)index
{
    NSString *string = index;
    NSString *numberRegex = @"\\d+";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    BOOL x = [numberTest evaluateWithObject:index];
    if (x) {
        string = [NSString stringWithFormat:@"第%@话", index];
    }
    return string;
}

@end
