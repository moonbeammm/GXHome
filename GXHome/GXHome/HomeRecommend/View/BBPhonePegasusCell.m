//
//  BBPhonePegasusCell.m
//  BBPhone
//
//  Created by sgx on 2018/1/22.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "BBPhonePegasusCell.h"
#import "BBPhoneExpression.h"

@interface BBPhonePegasusCell ()

@end

@implementation BBPhonePegasusCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self bindSubviewsEventWithParentView:self];
}

- (void)installCellWithDict:(NSDictionary *)dict {
    [self bindSubviewsModelWithParentView:self dict:dict];
}

#pragma mark - 事件绑定

- (void)bindSubviewsEventWithParentView:(UIView *)parentView {
    for (UIView *subView in parentView.subviews) {

        /// 事件绑定
        if ([subView respondsToSelector:@selector(bili_event)]) {
            NSString *event = [subView valueForKey:@"bili_event"];
            if (event && event.length > 0) {
                [self bindViewActionClickWithView:subView event:event];
            }
        }
        
        /// 递归遍历
        if (subView.subviews.count > 0) {
            [self bindSubviewsEventWithParentView:subView];
        }
    }
}

- (void)bindViewActionClickWithView:(UIView *)view event:(NSString *)event {
    if ([event isEqualToString:@"moreActionClick"]) {
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moreActionGestureClick:)];
        [view addGestureRecognizer:recognizer];
    } else {
        UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(defaultGestureClick:)];
        [view addGestureRecognizer:recognizer];
    }
}

- (void)moreActionGestureClick:(UIGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        UIView *view = recognizer.view;
        if (self.delegate && [self.delegate respondsToSelector:@selector(pegasusCell:clickMoreActionView:)]) {
            [self.delegate pegasusCell:self clickMoreActionView:view];
        }
    }
}

- (void)defaultGestureClick:(UIGestureRecognizer *)recognizer {
    if (recognizer.state == UIGestureRecognizerStateRecognized) {
        UIView *view = recognizer.view;
        if ([view respondsToSelector:@selector(bili_event)]) {
            NSString *eventID = [view valueForKey:@"bili_event"];
            if (self.delegate && [self.delegate respondsToSelector:@selector(pegasusCell:clickView:eventID:)]) {
                [self.delegate pegasusCell:self clickView:view eventID:eventID];
            }
        }
    }
}

#pragma mark - 数据绑定

- (void)bindSubviewsModelWithParentView:(UIView *)parentView dict:(NSDictionary *)dict {
    for (UIView *subView in parentView.subviews) {
        
        /// 数据绑定
        if ([subView respondsToSelector:@selector(bili_content)]) {
            NSString *content = [subView valueForKey:@"bili_content"];
            if (content && content.length > 0) {
                id contentValue = [BBPhoneExpression expressionWithKey:content object:dict];
                [self configViewContent:subView content:contentValue];
            }
        }
        /// 递归遍历
        if (subView.subviews.count > 0) {
            [self bindSubviewsModelWithParentView:subView dict:dict];
        }
    }
}

- (void)configViewContent:(UIView *)view content:(NSString *)content {
    if ([view isKindOfClass:[BBPhonePegasusLabel class]]) {
        BBPhonePegasusLabel *subLabel = (BBPhonePegasusLabel *)view;
        [subLabel setTitleWithText:content];
    } else if ([view isKindOfClass:[BBPhonePegasusImageView class]]) {
        BBPhonePegasusImageView *subImageView = (BBPhonePegasusImageView *)view;
        [subImageView setImageWithURL:content size:CGSizeZero];
    }
}

@end
