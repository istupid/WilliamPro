//
//  UIButton+InitObject.h
//
//  Created by William on 2017/9/1.
//  Copyright © 2017 William. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (InitObject)

#pragma mark - get text or image online

+ (UIButton *)wj_button;

+ (UIButton *)wj_buttonWithFont:(UIFont *)font
                      textColor:(UIColor *)textColor;

#pragma mark - title

+ (UIButton *)wj_buttonWithText:(NSString *)text;

+ (UIButton *)wj_buttonWithText:(NSString *)text
                           font:(UIFont *)font;

+ (UIButton *)wj_buttonWithText:(NSString *)text
                      textColor:(UIColor *)textColor;

+ (UIButton *)wj_buttonWithText:(NSString *)text
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor;


#pragma mark - image

+ (UIButton *)wj_buttonWithImage:(NSString *)image;

+ (UIButton *)wj_buttonWithImage:(NSString *)image
                            text:(NSString *)text;

+ (UIButton *)wj_buttonWithImage:(NSString *)image
                            text:(NSString *)text
                            font:(UIFont *)font;

+ (UIButton *)wj_buttonWithImage:(NSString *)image
                            text:(NSString *)text
                            font:(UIFont *)font
                       textColor:(UIColor *)textColor;

#pragma mark - select unselect

+ (UIButton *)wj_buttonWithImage:(NSString *)normalImage
                   selectedImage:(NSString *)selectImage;

+ (UIButton *)wj_buttonWithText:(NSString *)text
                    normalImage:(NSString *)normalImage
                  selectedImage:(NSString *)selectImage;

- (UIButton *)wj_buttonWithText:(NSString *)text
                    normalImage:(UIImage *)normalImage
                  selectedImage:(UIImage *)selectImage;

#pragma mark - other

+ (UIButton *)wj_buttonWithFont:(UIFont *)font
                    normalColor:(UIColor *)normalColor
                    normalImage:(NSString *)normalImage;

+ (UIButton *)wj_buttonWithFont:(UIFont *)font
                   normalColor:(UIColor *)normalColor
                 selectedColor:(UIColor *)selectedColor
                   normalImage:(NSString *)normalImage
                 selectedImage:(NSString *)selectedImage;
@end
