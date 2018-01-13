//
//  GXHomeVirtualFeedCell.m
//  GXHome
//
//  Created by sgx on 2018/1/13.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeVirtualFeedCell.h"
#import "VVBinaryLoader.h"
#import "VVViewFactory.h"
#import "VVViewContainer.h"

@interface GXHomeVirtualFeedCell ()

@property (nonatomic, strong) VVViewContainer *container;

@end

@implementation GXHomeVirtualFeedCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

    }
    return self;
}

- (void)installWithModel:(NSDictionary *)dict params:(NSDictionary *)params {
    [self.container removeFromSuperview];
    if (![[VVBinaryLoader shareInstance] getUICodeWithName:dict[@"gotoType"]]) {
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:dict[@"gotoType"] ofType:@"out"];
        
        NSData *buffer = [NSData dataWithContentsOfFile:path];
        [[VVBinaryLoader shareInstance] loadFromBuffer:buffer];
    }
    self.container = (VVViewContainer *)[[VVViewFactory shareFactoryInstance] obtainVirtualWithKey:dict[@"gotoType"]];
    [self.contentView addSubview:self.container];
    self.container.backgroundColor = [UIColor blueColor];
    self.container.frame = self.contentView.bounds;
    [self.container update:dict];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"");
}

+ (NSUInteger)getHeigthWithModel:(id)model params:(NSDictionary *)params {
    return 500;
}

@end
