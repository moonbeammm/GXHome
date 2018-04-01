//
//  BBPhoneExpression.h
//  BBPhone
//
//  Created by gx on 2018/1/21.
//  Copyright © 2018年 gx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBPhoneExpression : NSObject

/**
 key: 如: ${user.name} 或 ${tags[0]} 或 @{${follow}?关注:未关注}
 object: 可以是字典或数组
 return: 对应的值
 */
+ (nullable id)expressionWithKey:(nonnull NSString *)key object:(nullable id)object;

@end

