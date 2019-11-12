//
//  WJWaterfallsFlowFooterView.m
//
//  Created by William on 2015/6/17.
//  Copyright © 2015 William. All rights reserved.
//

#import "WJWaterfallsFlowFooterView.h"

@interface WJWaterfallsFlowFooterView ()

@property (nonatomic, weak) UIActivityIndicatorView *indicatorView;

@end

@implementation WJWaterfallsFlowFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.whiteColor;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:indicatorView];
    indicatorView.bounds = CGRectMake(0, 0, self.bounds.size.height, self.bounds.size.height);
    indicatorView.center = CGPointMake(self.center.x, self.bounds.size.height * 0.5);
    self.indicatorView = indicatorView;
}

- (BOOL)isAnimating {
    return self.indicatorView.isAnimating;
}

- (void)startAnimating {
    [self.indicatorView startAnimating];
}

- (void)stopAnimating {
    [self.indicatorView stopAnimating];
}

@end
