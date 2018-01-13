//
//  GXHomeVirtualFeedVC.m
//  GXHome
//
//  Created by sgx on 2018/1/10.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeVirtualFeedVC.h"
#import "VVBinaryLoader.h"
#import "VVViewFactory.h"
#import "VVViewContainer.h"

@interface GXHomeVirtualFeedVC ()

@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) VVViewContainer *container;

@end

@implementation GXHomeVirtualFeedVC
@synthesize viewModel;

- (instancetype)init
{
    if (self = [super init]) {
        self.title = @"VirtualFeed";
        self.array = @[
                       @{@"gotoType":@"AVX",
                         @"cover":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
                         @"title":@"第一个数据"
                         },
//                       @{@"gotoType":@"av",
//                         @"imgUrl":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
//                         @"title":@"第一个数据"
//                         },
//                       @{@"gotoType":@"av",
//                         @"imgUrl":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
//                         @"title":@"第一个数据"
//                         },
//                       @{@"gotoType":@"bangumi",
//                         @"imgUrl":@"https://gw.alicdn.com/tps/TB1Nin9JFXXXXbXaXXXXXXXXXXX-224-224.png",
//                         @"title":@"第二个数据"
//                         },
                       ];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configSubviews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

#pragma mark - Public Method

#pragma mark - Event Response

#pragma mark - Private Method

#pragma mark - Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row < self.array.count) {
        NSDictionary *dict = self.array[indexPath.row];
        if (![[VVBinaryLoader shareInstance] getUICodeWithName:dict[@"gotoType"]]) {
            NSString *path = [[NSBundle bundleWithIdentifier:@"com.sgx.GXHome"] pathForResource:dict[@"gotoType"] ofType:@"out"];
            
            NSData *buffer = [NSData dataWithContentsOfFile:path];
            [[VVBinaryLoader shareInstance] loadFromBuffer:buffer];
        }
        self.container = (VVViewContainer *)[[VVViewFactory shareFactoryInstance] obtainVirtualWithKey:dict[@"gotoType"]];
        [cell.contentView addSubview:self.container];
        self.container.backgroundColor = [UIColor blueColor];
        self.container.frame = CGRectMake(0, 0, 375, 1000);
        [self.container update:dict];
    }
    return cell;
}

#pragma mark - Initialize Method

- (void)configSubviews
{
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:[UITableViewCell description]];
}

@end
