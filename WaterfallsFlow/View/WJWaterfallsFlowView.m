//
//  WJWaterfallsFlowView.m
//
//  Created by William on 2015/6/12.
//  Copyright © 2015 William. All rights reserved.
//

#import "WJWaterfallsFlowView.h"
#import "WJWaterfallsFlowViewCell.h"
#import "WJWaterfallsFlowFooterView.h"
#import "WJWaterfallsFlowViewLayout.h"

#define kReusedID @"kWaterfallsFlowViewCell"
#define kFooter @"kWaterfallsFlowFooterView"

@interface WJWaterfallsFlowView() <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, WJWaterfallsFlowViewLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) WJWaterfallsFlowViewLayout *flowLayout;

@property (nonatomic, strong) WJWaterfallsFlowFooterView *footerView;

@end


@implementation WJWaterfallsFlowView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    CGFloat width = UIScreen.mainScreen.bounds.size.width;

    _flowLayout = [[WJWaterfallsFlowViewLayout alloc] init];
    _flowLayout.dataSource = self;
    _flowLayout.footerReferenceSize = CGSizeMake(width, 40);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_flowLayout];
    [self addSubview:_collectionView];
    
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = UIColor.whiteColor;
    [_collectionView registerClass:WJWaterfallsFlowViewCell.class forCellWithReuseIdentifier:kReusedID];
    [_collectionView registerClass:WJWaterfallsFlowFooterView.class forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kFooter];
}

- (void)setupConstraints {
//    _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    _collectionView.frame = self.bounds;
}

- (void)layoutSubviews {
    _collectionView.frame = self.bounds;
}



- (void)setDataList:(NSArray *)dataList {
    _dataList = dataList;
    [_collectionView reloadData];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WJWaterfallsFlowViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kReusedID forIndexPath:indexPath];
    cell.model = self.dataList[indexPath.item];
    return cell;
}

///
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionFooter) {
        self.footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kFooter forIndexPath:indexPath];
        return self.footerView;
    } else {
        return nil;
    }
}

#pragma mark -

- (CGFloat)layoutHeightAndWidthRatioItemAtIndexPath:(NSIndexPath *)indexPath {
    WJShopModel *model = self.dataList[indexPath.item];
    return (CGFloat)model.height / (CGFloat)model.width;
}

#pragma mark - 滚动界面的方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    /// 1. 有了footerView后要设置为nil
    /// 1.1 还需要一个判断条件，就是数据加载完成之后改变条件
    /// 只有当这两个条件同时满足则加载数据
    if (self.footerView == nil) {
        return;
    };
    if (!self.footerView.isAnimating && self.footerView != nil) {
        NSLog(@"加载更多数据");
        [self.footerView startAnimating];
        
        /// 加载数据
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if ([self.delegate respondsToSelector:@selector(flowView:loadMoreData:)]) {
                __weak __typeof(self) weakSelf = self;
                [self.delegate flowView:self loadMoreData:^(NSArray *dataList) {
                    __strong __typeof(weakSelf) strongSelf = weakSelf;
                    strongSelf.dataList = dataList;
                    [strongSelf.collectionView reloadData];
                    [strongSelf.footerView stopAnimating];
                    strongSelf.footerView = nil;
                }];
            } else {
                [self.footerView stopAnimating];
                self.footerView = nil;
            }
        });
    }
}



@end
