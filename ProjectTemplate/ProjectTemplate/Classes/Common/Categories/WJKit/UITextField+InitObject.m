//
//  UITextField+InitObject.m
//  Car_Hi
//
//  Created by William on 2017/9/5.
//  Copyright © 2017 William. All rights reserved.
//

#import "UITextField+InitObject.h"
#import "WJFont.h"
#import "WJColor.h"

@implementation UITextField (InitObject)

+ (UITextField *)wj_field {
    return [self wj_fieldWithFont:FONT(14)];
}

+ (UITextField *)wj_fieldWithFont:(UIFont *)font {
    return [self wj_fieldWithFont:font textColor:[WJColor titleColor]];
}

+ (UITextField *)wj_fieldWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor {
    return [self wj_fieldWithFont:font
                        textColor:textColor
                      placeholder:nil];
}

+ (UITextField *)wj_fieldWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor
                      placeholder:(NSString *)placeholder {
    return [self wj_fieldWithFont:font
                        textColor:textColor
                      placeholder:placeholder
                    textAlignment:NSTextAlignmentLeft];
}

+ (UITextField *)wj_fieldWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment {
    return [self wj_fieldWithFont:font
                        textColor:textColor
                      placeholder:nil
                    textAlignment:textAlignment];
}

+ (UITextField *)wj_fieldWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor
                      placeholder:(NSString *)placeholder
                    textAlignment:(NSTextAlignment)textAlignment {
    UITextField *tf = [[UITextField alloc] init];
    tf.font = font;
    tf.textColor = textColor;
    tf.textAlignment = textAlignment;
    tf.placeholder = placeholder;
    return tf;
}


+ (UITextField *)wj_fieldWithPlaceholder:(NSString *)placeholder {
    return [self wj_fieldWithFont:FONT(12)
                        textColor:[WJColor titleColor]
                      placeholder:placeholder
                    textAlignment:NSTextAlignmentLeft];
}

@end
