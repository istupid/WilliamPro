//
//  UIButton+CustomStyle.h
//
//  Created by William on 02/11/2016.
//  Copyright © 2016 William. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, WJButtonCustomStyle) {
    WJButtonCustomStyleTop,     // 图片上，文字下
    WJButtonCustomStyleLeading, // 图片左，文字右
    WJButtonCustomStyleBottom,  // 图片下，文字上
    WJButtonCustomStyleTrailing // 图片右，文字左
};


NS_ASSUME_NONNULL_BEGIN

@interface UIButton (CustomStyle)

/**
 *  @desc 默认字体大小14px，默认字体颜色黑色0x4A4A4A，默认图片文字间距0.5px
 *
 *
 */
+ (UIButton *)buttonWithImage:(NSString *)image
                         text:(NSString *)text
                        style:(WJButtonCustomStyle)style;

/**
 *  @desc 默认字体颜色黑色0x000000，默认图片文字间距0.5px
 *
 *
 */
+ (UIButton *)buttonWithImage:(NSString *)image
                         text:(NSString *)text
                         font:(UIFont *)font
                        style:(WJButtonCustomStyle)style;

/**
 *  @desc 默认图片文字间距0.5px
 *
 *
 *
 */
+ (UIButton *)buttonWithImage:(NSString *)image
                         text:(NSString *)text
                         font:(UIFont *)font
                        color:(UIColor *)color
                        style:(WJButtonCustomStyle)style;

/**
 *
 *
 *
 *
 */
+ (UIButton *)buttonWithImage:(NSString *)image
                         text:(NSString *)text
                         font:(UIFont *)font
                        color:(UIColor *)color
                        space:(CGFloat)space
                        style:(WJButtonCustomStyle)style;


#pragma mark - 网络加载文字和图片

+ (UIButton *)buttonWithFont:(UIFont *)font
                       color:(UIColor *)color
                       space:(CGFloat)space
                       stype:(WJButtonCustomStyle)style;



/**
 *
 *
 *
 *
 */
+ (UIButton *)buttonWithRect:(CGRect)rect
                       image:(NSString *)image
                        text:(NSString *)text
                        font:(UIFont *)font
                       color:(UIColor *)color
                       space:(CGFloat)space
                       style:(WJButtonCustomStyle)style;


- (void)calculateImageTextSpace:(CGFloat)space style:(WJButtonCustomStyle)style;

@end

NS_ASSUME_NONNULL_END
