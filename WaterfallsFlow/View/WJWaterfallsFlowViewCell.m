//
//  WJWaterfallsFlowViewCell.m
//
//  Created by William on 2015/6/12.
//  Copyright © 2015 William. All rights reserved.
//

#import "WJWaterfallsFlowViewCell.h"

@interface WJWaterfallsFlowViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel     *titleLabel;

@end

@implementation WJWaterfallsFlowViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    _imageView = [[UIImageView alloc] init];
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_titleLabel];
    
    NSDictionary *dict = @{@"imageView":_imageView, @"contentView": self.contentView};
    NSArray *V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[imageView(==contentView)]|" options:NSLayoutFormatAlignAllTop metrics:nil views:dict];
    [self.contentView addConstraints:V];
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[imageView(==contentView)]|" options:NSLayoutFormatAlignAllTop metrics:nil views:dict]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setModel:(WJShopModel *)model {
    _model = model;
    _imageView.image = [UIImage imageNamed:model.icon];
    _titleLabel.text = model.price;
}

@end
