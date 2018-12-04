//
//  NSAttributedString+InitObject.m
//
//  Created by William on 2017/9/1.
//  Copyright © 2017 William. All rights reserved.
//

#import "NSAttributedString+InitObject.h"
#import "WJFont.h"
#import "WJColor.h"

@implementation NSAttributedString (InitObject)

#pragma mark - no paragraph style

+ (instancetype)wj_attrWithText:(NSString *)text {
    return [self wj_attrWithText:text font:FONT(14)];
}

+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font {
    return [self wj_attrWithText:text
                            font:font
                       textColor:[WJColor titleColor]];
}


+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor {
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:textColor
                                 };
    return [self wj_attrWithText:text attributes:attributes];
}

#pragma mark - all method call

+ (instancetype)wj_attrWithText:(NSString *)text attributes:(NSDictionary *)attributes {
    return [[self alloc] initWithString:text attributes:attributes];
}


#pragma mark - Paragraph Style

+ (instancetype)wj_attrWithText:(NSString *)text
                    lineSpacing:(CGFloat)lineSpacing {
    return [self wj_attrWithText:text
                            font:FONT(14)
                     lineSpacing:lineSpacing];
}

+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                    lineSpacing:(CGFloat)lineSpacing {
    return [self wj_attrWithText:text
                            font:font
                       textColor:[WJColor titleColor]
                     lineSpacing:lineSpacing];
}

+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor
                    lineSpacing:(CGFloat)lineSpacing {
    return [self wj_attrWithText:text
                            font:font
                       textColor:textColor
                     lineSpacing:lineSpacing
                   textAlignment:NSTextAlignmentLeft];
}

+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor
                    lineSpacing:(CGFloat)lineSpacing
                  textAlignment:(NSTextAlignment)textAlignment {
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    paragraph.alignment = textAlignment;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 NSForegroundColorAttributeName:textColor,
                                 NSParagraphStyleAttributeName:paragraph
                                 };
    return [self wj_attrWithText:text attributes:attributes];
}

#pragma mark - 缩进需要再调整

+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                    lineSpacing:(CGFloat)lineSpacing
                     headIndent:(CGFloat)headIndent {
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    paragraph.firstLineHeadIndent = headIndent;
    paragraph.headIndent = headIndent;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraph
                                 };
    
    return [self wj_attrWithText:text attributes:attributes];
}

+ (instancetype)wj_attrWithText:(NSString *)text
                           font:(UIFont *)font
                    lineSpacing:(CGFloat)lineSpacing
            firstLineHeadIndent:(CGFloat)firstLineHeadIndent
                     headIndent:(CGFloat)headIndent {
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = lineSpacing;
    paragraph.firstLineHeadIndent = firstLineHeadIndent;
    paragraph.headIndent = headIndent;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:paragraph
                                 };
    return [self wj_attrWithText:text attributes:attributes];
}

@end
