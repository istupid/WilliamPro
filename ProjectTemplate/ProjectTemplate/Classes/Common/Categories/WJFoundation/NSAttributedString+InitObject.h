//
//  NSAttributedString+InitObject.h
//
//  Created by William on 2017/9/1.
//  Copyright © 2017 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (InitObject)

/// 默认字体大小 14，默认字体颜色 darkGrayColor

/*
 * @param   text    字符串
 *
 * @return  NSAttributedString
 */
+ (instancetype)wj_attrWithText:(NSString *)text;

/*
 * @param   text    字符串
 * @param   size    字体大小
 *
 * @return  NSAttributedString
 */
+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font;

/*
 * @param   text    字符串
 * @param   size    字体大小
 * @param   color   字体颜色
 *
 * @return  NSAttributedString
 */
+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor;


#pragma mark 

+ (instancetype)wj_attrWithText:(NSString *)text
                    lineSpacing:(CGFloat)lineSpacing;


+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                    lineSpacing:(CGFloat)lineSpacing;

+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor
                    lineSpacing:(CGFloat)lineSpacing;


+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor
                    lineSpacing:(CGFloat)lineSpacing
                  textAlignment:(NSTextAlignment)textAlignment;


#pragma mark - head indent

+ (instancetype)wj_attrWithText:(NSString *)text
                        font:(UIFont *)font
                 lineSpacing:(CGFloat)lineSpacing
                  headIndent:(CGFloat)headIndent;


+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                    lineSpacing:(CGFloat)lineSpacing
            firstLineHeadIndent:(CGFloat)firstLineHeadIndent
                     headIndent:(CGFloat)headIndent;

@end
