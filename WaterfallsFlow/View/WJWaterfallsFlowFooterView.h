//
//  WJWaterfallsFlowFooterView.h
//
//  Created by William on 2015/6/17.
//  Copyright © 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WJWaterfallsFlowFooterView : UICollectionReusableView

@property(nonatomic, readonly, getter=isAnimating) BOOL animating;

- (void)startAnimating;

- (void)stopAnimating;

@end

NS_ASSUME_NONNULL_END
