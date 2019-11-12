//
//  WJWaterfallsFlowViewLayout.m
//
//  Created by William on 2015/6/16.
//  Copyright © 2015 William. All rights reserved.
//

#import "WJWaterfallsFlowViewLayout.h"

@interface WJWaterfallsFlowViewLayout ()

/// 返回界面可见控件的属性数组
@property (nonatomic, strong) NSMutableArray *changeAttributeArray;

/// 记录控件最大Y的数组
@property (nonatomic, strong) NSMutableArray *maxYArray;

/// 获取最小Y
@property (nonatomic, assign) CGFloat minY;

/// 获取最大Y
@property (nonatomic, assign) CGFloat maxY;

/// X的索引
@property (nonatomic, assign) NSInteger indexX;

@end

@implementation WJWaterfallsFlowViewLayout


- (void)prepareLayout {
    self.changeAttributeArray = nil;
    self.maxYArray = nil;
    
    /// 改变每个Item的属性
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    
    /// 遍历获取每个item的索引
    for (int i = 0; i < itemCount; i++) {
        NSIndexPath *itemIndexPath = [NSIndexPath indexPathForItem:i inSection:0];
        /// 获取改变后的控件属性
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
        [self.changeAttributeArray addObject:attributes];
    }
    
    /// 加载 footerView
    /// 获取 footer view 索引
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    UICollectionViewLayoutAttributes *footerViewAttributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter withIndexPath:indexPath];
    footerViewAttributes.frame = CGRectMake(0, self.maxY+self.sectionInset.bottom, self.collectionView.bounds.size.width, self.footerReferenceSize.height);
    if (footerViewAttributes) {
        [self.changeAttributeArray addObject:footerViewAttributes];
    } else {
        NSLog(@"footer size %@", NSStringFromCGSize(self.footerReferenceSize));
    }
}

/// 返回用户可见区域内的控件
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.changeAttributeArray;
}

/// 把item改变后，就可以得到想要的界面
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *currentAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    /// 宽 = (屏幕宽 - sectionInsetLeft - (控件数 - 1) * 控件间距 - sectionInsetRight) / 控件数
    CGFloat attrW = (self.collectionView.bounds.size.width - (self.columns - 1) * self.minimumInteritemSpacing - self.sectionInset.left - self.sectionInset.right) / self.columns;
    CGFloat attrH = [self.dataSource layoutHeightAndWidthRatioItemAtIndexPath:indexPath] * attrW;
    /// 获取最小Y 才更新index
    CGFloat attrY = self.minY + self.minimumLineSpacing;
    CGFloat attrX = self.sectionInset.left + self.indexX * (self.minimumInteritemSpacing + attrW);
    self.maxYArray[self.indexX] = @(attrY + attrH);
    currentAttributes.frame = CGRectMake(attrX, attrY, attrW, attrH);
    return currentAttributes;
}


- (CGSize)collectionViewContentSize {
    /// 找到最大Y + sectionInset.bottom + footer view height
    return CGSizeMake(0, self.maxY + self.sectionInset.bottom + self.footerReferenceSize.height);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return [super shouldInvalidateLayoutForBoundsChange:newBounds];
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    return [super targetContentOffsetForProposedContentOffset:proposedContentOffset withScrollingVelocity:velocity];
}

#pragma mark - 成员属性懒加载

- (NSInteger)columns {
    if (!_columns) {
        _columns = 3;
    }
    return _columns;
}

- (NSMutableArray *)changeAttributeArray {
    if (!_changeAttributeArray) {
        _changeAttributeArray = [NSMutableArray array];
    }
    return _changeAttributeArray;
}

- (NSMutableArray *)maxYArray {
    if (!_maxYArray) {
        _maxYArray = [NSMutableArray array];
        for (int i = 0; i < self.columns; i++) {
            [_maxYArray addObject:@"0"];
        }
    }
    return _maxYArray;
}

- (CGFloat)minY {
    _minY = MAXFLOAT;
    for (int i = 0; i < self.maxYArray.count; i++) {
        CGFloat currentY = [self.maxYArray[i] doubleValue];
        if (currentY < _minY) {
            _minY = currentY;
            _indexX = i;
        }
    }
    return _minY;
}

- (CGFloat)maxY {
    _maxY = 0;
    for (int i = 0; i < self.maxYArray.count; i++) {
        CGFloat currentY = [self.maxYArray[i] doubleValue];
        if (currentY > _maxY) {
            _maxY = currentY;
        }
    }
    return _maxY;
}

@end
