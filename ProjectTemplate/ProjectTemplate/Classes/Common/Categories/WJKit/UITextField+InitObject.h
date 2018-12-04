//
//  UITextField+InitObject.h
//
//  Created by William on 2017/9/5.
//  Copyright © 2017 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (InitObject)

+ (UITextField *)wj_field;


+ (UITextField *)wj_fieldWithFont:(UIFont *)font;

+ (UITextField *)wj_fieldWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor;

+ (UITextField *)wj_fieldWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor
                      placeholder:(NSString *)placeholder;


+ (UITextField *)wj_fieldWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment;

+ (UITextField *)wj_fieldWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor
                      placeholder:(NSString *)placeholder
                    textAlignment:(NSTextAlignment)textAlignment;


+ (UITextField *)wj_fieldWithPlaceholder:(NSString *)placeholder;


@end
