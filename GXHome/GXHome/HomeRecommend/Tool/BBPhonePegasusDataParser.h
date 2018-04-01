//
//  BBPhonePegasusDataParser.h
//  BBPhone
//
//  Created by sgx on 2018/1/22.
//  Copyright © 2018年 gx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    BBPhoneLayoutTypeSingle,
    BBPhoneLayoutTypeDouble,
    BBPhoneLayoutTypeSearch,
} BBPhoneLayoutType;

@interface BBPhonePegasusDataParser : NSObject

+ (void)updateDynamicData;
+ (NSArray *)getSupportCellTypes:(BBPhoneLayoutType)type;
+ (UINib *)getNibWithClass:(NSString *)classStr;
+ (NSString *)transformLayoutType:(NSString *)layoutType type:(BBPhoneLayoutType)type;
@end
