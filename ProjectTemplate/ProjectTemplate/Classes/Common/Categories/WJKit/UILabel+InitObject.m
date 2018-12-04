//
//  UILabel+InitObject.m
//
//  Created by William on 7/6/15.
//  Copyright © 2015 William. All rights reserved.
//

#import "UILabel+InitObject.h"
#import "WJFont.h"
#import "WJColor.h"

@implementation UILabel (InitObject)

#pragma mark - corner radius

+ (UILabel *)wj_labelWithCornerRadius:(CGFloat)cornerRadius {
  return [self wj_labelWithCornerRadius:cornerRadius borderColor:[UIColor clearColor]];
}

+ (UILabel *)wj_labelWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)color {
  UILabel *label = [UILabel new];
  label.layer.borderWidth = 0.5;
  label.layer.cornerRadius = cornerRadius;
  label.layer.borderColor = color.CGColor;
  label.layer.masksToBounds = NO;
  label.layer.shouldRasterize = YES;
  label.layer.rasterizationScale = [UIScreen mainScreen].scale;
  label.font = FONT(10.0);
  return label;
}

+ (UILabel *)promotionLabel {
  return [self wj_labelWithCornerRadius:2.0];
}

#pragma mark - init label

+ (UILabel *)wj_labelWithFont:(UIFont *)font {
    return [self wj_labelWithFont:font
                        textColor:[WJColor titleColor]];
}


+ (UILabel *)wj_labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor {
    return [self wj_labelWithFont:font
                        textColor:textColor
                    textAlignment:NSTextAlignmentLeft];
}


+ (UILabel *)wj_labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment {
    return [self wj_labelWithFont:font
                        textColor:textColor
                    numberOfLines:1
                    textAlignment:textAlignment];
}

#pragma mark - multi line text

+ (UILabel *)wj_labelWithFont:(UIFont *)font
                numberOfLines:(NSUInteger)numberOfLines {
    return [self wj_labelWithFont:font
                        textColor:[WJColor titleColor]
                    numberOfLines:numberOfLines];
}


+ (UILabel *)wj_labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                numberOfLines:(NSUInteger)numberOfLines {
    return [self wj_labelWithFont:font
                        textColor:textColor
                    numberOfLines:numberOfLines
                    textAlignment:NSTextAlignmentLeft];
}


+ (UILabel *)wj_labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                numberOfLines:(NSUInteger)numberOfLines
                textAlignment:(NSTextAlignment)textAlignment {
    return [self wj_labelWithText:nil
                             font:font
                        textColor:textColor
                    numberOfLines:numberOfLines
                    textAlignment:textAlignment];
}

#pragma mark - text

+ (UILabel *)wj_labelWithText:(NSString *)text {
    return [self wj_labelWithText:text font:FONT(14)];
}

+ (UILabel *)wj_labelWithText:(NSString *)text
                         font:(UIFont *)font {
    return [self wj_labelWithText:text
                             font:font
                        textColor:[WJColor titleColor]];
}

+ (UILabel *)wj_labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)textColor {
    return [self wj_labelWithText:text
                             font:font
                        textColor:textColor
                    textAlignment:NSTextAlignmentLeft];
}

+ (UILabel *)wj_labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment {
    return [self wj_labelWithText:text
                             font:font
                        textColor:textColor
                    numberOfLines:1
                    textAlignment:textAlignment];
}

+ (UILabel *)wj_labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)textColor
                numberOfLines:(NSUInteger)numberOfLines
                textAlignment:(NSTextAlignment)textAlignment {
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.numberOfLines = numberOfLines;
    label.textAlignment = textAlignment;
    return label;
}


@end
