//
//  BBPhonePegasusImageView.h
//  BBPhone
//
//  Created by sgx on 2018/1/20.
//  Copyright © 2018年 gx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBPhonePegasusImageView : UIImageView

@property (nonatomic, strong) NSString *bili_content;
@property (nonatomic, strong) NSString *bili_event;
@property (nonatomic, strong) NSString *bili_bgColor;
@property (nonatomic, strong) NSString *bili_alpha;

- (void)setImageWithURL:(NSString *)url size:(CGSize)size;

@end
