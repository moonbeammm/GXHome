//
//  GXHomeRecommendVCV2.m
//  GXHome
//
//  Created by sgx on 2018/1/25.
//  Copyright © 2018年 sunguangxin. All rights reserved.
//

#import "GXHomeRecommendVCV2.h"
#import "GXHomeRecommendVM.h"
#import "BBPhonePegasusCollectionCell.h"
#import "BBPhonePegasusDataParser.h"

@interface GXHomeRecommendVCV2 () <UICollectionViewDelegate, UICollectionViewDataSource, BBPhonePegasusDynamicProtocol>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *cellClassArr;
@property (nonatomic, strong) GXHomeRecommendVM *viewModel;

@end

@implementation GXHomeRecommendVCV2

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.viewModel = [[GXHomeRecommendVM alloc] init];
        [self.viewModel loadData];
        self.cellClassArr = [BBPhonePegasusDataParser getSupportCellTypes:BBPhoneLayoutTypeDouble];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    for (NSString *layoutType in self.cellClassArr) {
        [self.collectionView registerNib:[BBPhonePegasusDataParser getNibWithClass:layoutType] forCellWithReuseIdentifier:layoutType];
    }
    
}

- (void)pegasusCell:(UITableViewCell *)cell clickView:(UIView *)view eventID:(NSString *)eventID {
    NSLog(@"clickView");
}
- (void)pegasusCell:(UITableViewCell *)cell clickMoreActionView:(UIView *)view {
    NSLog(@"clickMoreActionView");
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.viewModel.objects.count;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 12, 0, 12);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= self.viewModel.objects.count) {
        return [UICollectionViewCell new];
    }
    NSDictionary *dict = self.viewModel.objects[indexPath.row];
    NSString *layoutType = [BBPhonePegasusDataParser transformLayoutType:dict[@"layout_type"] type:BBPhoneLayoutTypeDouble];
    if (![_cellClassArr containsObject:layoutType]) {
        return [UICollectionViewCell new];
    }
    BBPhonePegasusCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:layoutType forIndexPath:indexPath];
    
    if ([cell respondsToSelector:@selector(installCellWithDict:)]) {
        [cell installCellWithDict:dict];
        if (!cell.delegate) {
            cell.delegate = self;
        }
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"didSelectItemAtIndexPath");
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.estimatedItemSize = CGSizeMake(1, 1);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.alwaysBounceVertical = YES;
    }
    return _collectionView;
}

@end
