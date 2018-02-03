//
//  BBPhonePegasusDataParser.m
//  BBPhone
//
//  Created by sgx on 2018/1/22.
//  Copyright © 2018年 Bilibili. All rights reserved.
//

#import "BBPhonePegasusDataParser.h"

#import <GXNetwork/GXNetworkManager.h>
#import <GXRuler/ZipArchive.h>

static NSArray *_cellClassArr = nil;
static BOOL _serverDataOK = NO;

@implementation BBPhonePegasusDataParser

+ (void)updateDynamicData {
    GXApiOptions *options = [[GXApiOptions alloc] init];
    options.baseUrl = @"http://www.sunxxxxx.com/images/dynamic.zip";
    
    GXNetworkManager *manager = [[GXNetworkManager alloc] initWithOptions:options progress:^(NSProgress * _Nullable downloadProgress) {
        NSLog(@"ViewController: progress: %@",downloadProgress);
    } success:^(NSDictionary * _Nullable result, NSURLResponse * _Nullable response) {
        NSLog(@"ViewController: \ntask: \n%@\nresponseObject:\n%@",result,response);
    } failure:^(NSDictionary * _Nullable result, NSError * _Nullable error) {
        NSLog(@"ViewController: task: %@>>>>error:%@",result,error);
    }];
    manager.preProcessRawData = ^NSData * _Nullable(NSData * _Nullable data) {
        NSError *error = nil;
        [data writeToFile:kLibraryDirectory(@"dynamic.zip") options:0 error:&error];
        
        if (!error) {
            ZipArchive *zip = [[ZipArchive alloc] init];
            if ([zip UnzipOpenFile:kLibraryDirectory(@"dynamic.zip")]) {
                [zip UnzipFileTo:kLibraryDirectory(@"/dynamic") overWrite:YES];
            }
            [zip UnzipCloseFile];
        }
        return data;
    };
    [manager requestAsync];
}

+ (NSArray *)getSupportCellTypes:(BBPhoneLayoutType)type {
    if (_cellClassArr.count > 0) {
        return _cellClassArr;
    }
    NSData *rowd = nil;
    if ([[self class] serverDataIsOK]) {
        rowd = [NSData dataWithContentsOfFile:kLibraryDirectory(@"/dynamic/layouts.json")];
    }
    if (!rowd) {
        rowd = [NSData dataWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"layouts" ofType:@"json"]];
    }
    if (!rowd) {
        _cellClassArr = nil;
    }
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:rowd options:0 error:nil];
    if ([dict[@"code"] integerValue] == 0) {
        _cellClassArr = dict[@"layouts"];
    } else {
        _cellClassArr = nil;
    }
    return [[self class] transformLayoutTypes:type layouts:_cellClassArr];
}

+ (NSArray *)transformLayoutTypes:(BBPhoneLayoutType)type layouts:(NSArray *)layouts {
    if (!layouts || layouts.count <= 0) {
        return nil;
    }
    NSString *pre = @"search_";
    if (type == BBPhoneLayoutTypeSingle) {
        pre = @"single_";
    } else if (type == BBPhoneLayoutTypeDouble) {
        pre = @"double_";
    }
    NSMutableArray *mutLayouts = [NSMutableArray arrayWithCapacity:layouts.count];
    for (NSString *layout in layouts) {
        NSString *temp_layout = [NSString stringWithFormat:@"%@%@",pre,layout];
        [mutLayouts addObject:temp_layout];
    }
    return mutLayouts;
}

+ (NSString *)transformLayoutType:(NSString *)layoutType type:(BBPhoneLayoutType)type {
    if (!layoutType || layoutType.length <= 0) {
        return nil;
    }
    NSString *pre = @"";
    if (type == BBPhoneLayoutTypeSingle) {
        pre = @"single_";
    } else if (type == BBPhoneLayoutTypeDouble) {
        pre = @"double_";
    } else if (type == BBPhoneLayoutTypeSearch) {
        pre = @"search_";
    }
    return [NSString stringWithFormat:@"%@%@",pre,layoutType];
}

+ (UINib *)getNibWithClass:(NSString *)classStr {
    if ([[self class] serverDataIsOK]) {
        NSString *nibName = [NSString stringWithFormat:@"/dynamic/%@.nib",classStr];
        NSData *server_data = [NSData dataWithContentsOfFile:kLibraryDirectory(nibName)];
        if (server_data) {
            // 服务端下发的xib文件
            return [UINib nibWithData:server_data bundle:[NSBundle bundleForClass:[self class]]];
        } else {
            // 本地的xib文件
            return [UINib nibWithNibName:classStr bundle:[NSBundle bundleForClass:[self class]]];
        }
    } else {
        // 本地的xib文件
        return [UINib nibWithNibName:classStr bundle:[NSBundle bundleForClass:[self class]]];
    }
}

/// 版本验证.后期添加
+ (BOOL)versionVerify {
    return YES;
}

/// 数据健全验证.后去添加
+ (BOOL)serverDataIsOK {
    if (!_serverDataOK) {
        //        _serverDataOK = YES;
    }
    return _serverDataOK;
}

@end

