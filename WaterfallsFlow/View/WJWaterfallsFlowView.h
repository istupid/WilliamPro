//
//  WJWaterfallsFlowView.h
//
//  Created by William on 2015/6/12.
//  Copyright © 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WJWaterfallsFlowView;

NS_ASSUME_NONNULL_BEGIN

@protocol WJWaterfallsFlowViewDelegate <NSObject>

- (void)flowView:(WJWaterfallsFlowView *)flowView loadMoreData:(void (^)(NSArray *))dataList;

@end

@interface WJWaterfallsFlowView : UIView

@property (nonatomic, weak) id<WJWaterfallsFlowViewDelegate> delegate;

@property (nonatomic, copy) NSArray *dataList;

@end

NS_ASSUME_NONNULL_END
