//
//  WJWaterfallsFlowViewLayout.h
//
//  Created by William on 2015/6/16.
//  Copyright © 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJWaterfallsFlowViewLayout;

NS_ASSUME_NONNULL_BEGIN

@protocol WJWaterfallsFlowViewLayoutDelegate <NSObject>

- (CGFloat)layoutHeightAndWidthRatioItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface WJWaterfallsFlowViewLayout : UICollectionViewFlowLayout

@property (nonatomic, weak) id<WJWaterfallsFlowViewLayoutDelegate> dataSource;

@property (nonatomic, assign) NSInteger columns;

@end

NS_ASSUME_NONNULL_END
