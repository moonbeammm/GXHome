//
//  NSDictionary+ParamParser.m
//  BBPhone
//
//  Created by sgx on 2018/1/21.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "NSDictionary+ParamParser.h"

@implementation NSDictionary (ParamParser)

- (NSString *)parserWithKey:(NSString *)key {
    if (!key || key.length <= 0 || !self || self.count <= 0) {
        return nil;
    }
    NSDictionary *tempSelf = [self mutableCopy];
    NSArray *keys = [key componentsSeparatedByString:@"."];
    for (NSInteger i = 0; i < keys.count; i++) {
        NSString *tempKey = keys[i];
        id tempValue = [self bili_safeValueFromKey:tempKey dict:tempSelf];
        if ([tempValue isKindOfClass:[NSDictionary  class]]) {
            tempSelf = tempValue;
        } else if (i == (keys.count-1)) {
            if ([tempValue isKindOfClass:[NSString class]]) {
                return tempValue;
            } else {
                return nil;
            }
        } else {
            return nil;
        }
    }
    return nil;
}

- (id)bili_safeValueFromKey:(NSString *)key dict:(NSDictionary *)dict {
    if ([dict.allKeys containsObject:key]) {
        return dict[key];
    } else {
        return nil;
    }
}

@end
