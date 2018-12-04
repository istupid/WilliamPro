//
//  UILabel+InitObject.h
//
//  Created by William on 7/6/15.
//  Copyright © 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (InitObject)

#pragma mark - corner radius

+ (UILabel *)wj_labelWithCornerRadius:(CGFloat)cornerRadius;

+ (UILabel *)wj_labelWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)color;

+ (UILabel *)promotionLabel;


#pragma mark - init label

+ (UILabel *)wj_labelWithFont:(UIFont *)font;

+ (UILabel *)wj_labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor;

+ (UILabel *)wj_labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
             textAlignment:(NSTextAlignment)textAlignment;

#pragma mark - multi line text

+ (UILabel *)wj_labelWithFont:(UIFont *)font
                numberOfLines:(NSUInteger)numberOfLines;

+ (UILabel *)wj_labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                numberOfLines:(NSUInteger)numberOfLines;

+ (UILabel *)wj_labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                numberOfLines:(NSUInteger)numberOfLines
                textAlignment:(NSTextAlignment)textAlignment;

#pragma mark -

+ (UILabel *)wj_labelWithText:(NSString *)text;

+ (UILabel *)wj_labelWithText:(NSString *)text
                         font:(UIFont *)font;

+ (UILabel *)wj_labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)textColor;

+ (UILabel *)wj_labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment;

+ (UILabel *)wj_labelWithText:(NSString *)text
                         font:(UIFont *)font
                    textColor:(UIColor *)textColor
                numberOfLines:(NSUInteger)numberOfLines
                textAlignment:(NSTextAlignment)textAlignment;

@end
