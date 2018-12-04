//
//  UIButton+InitObject.m
//
//  Created by William on 2017/9/1.
//  Copyright © 2017 William. All rights reserved.
//

#import "UIButton+InitObject.h"
#import "WJFont.h"
#import "WJColor.h"

@implementation UIButton (InitObject)

#pragma mark - get text or image online

+ (UIButton *)wj_button {
    return [self wj_buttonWithFont:FONT(14)
                         textColor:[WJColor titleColor]];
}

+ (UIButton *)wj_buttonWithFont:(UIFont *)font
                      textColor:(UIColor *)textColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    return button;
}

#pragma mark - image

+ (UIButton *)wj_buttonWithImage:(NSString *)image {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    // 点击无高亮
    button.adjustsImageWhenHighlighted = NO;
    return button;
}

+ (UIButton *)wj_buttonWithImage:(NSString *)image
                            text:(NSString *)text {
    return [self wj_buttonWithImage:image
                               text:text
                               font:FONT(14)];
}

+ (UIButton *)wj_buttonWithImage:(NSString *)image
                           text:(NSString *)text
                           font:(UIFont *)font {
    return [self wj_buttonWithImage:image
                               text:text
                               font:font
                          textColor:[WJColor titleColor]];
}

+ (UIButton *)wj_buttonWithImage:(NSString *)image
                           text:(NSString *)text
                           font:(UIFont *)font
                          textColor:(UIColor *)textColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    return button;
}

#pragma mark - title

+ (UIButton *)wj_buttonWithText:(NSString *)text {
    return [self wj_buttonWithText:text font:FONT(14)];
}

+ (UIButton *)wj_buttonWithText:(NSString *)text
                           font:(UIFont *)font{
    return [self wj_buttonWithText:text
                              font:font
                         textColor:[WJColor titleColor]];
}

+ (UIButton *)wj_buttonWithText:(NSString *)text
                      textColor:(UIColor *)textColor {
    return [self wj_buttonWithText:text
                              font:FONT(14)
                         textColor:textColor];
}

+ (UIButton *)wj_buttonWithText:(NSString *)text
                           font:(UIFont *)font
                      textColor:(UIColor *)textColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = font;
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    return button;
}


#pragma mark - select unselect

+ (UIButton *)wj_buttonWithImage:(NSString *)normalImage
                   selectedImage:(NSString *)selectImage {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    return button;
}

+ (UIButton *)wj_buttonWithText:(NSString *)text
                    normalImage:(NSString *)normalImage
                  selectedImage:(NSString *)selectedImage {
    UIButton *button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateHighlighted];
    [button setImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    button.titleLabel.font = FONT(14);
    [button setTitleColor:[WJColor titleColor] forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateNormal];
    button.showsTouchWhenHighlighted = NO;
    return button;
}

- (UIButton *)wj_buttonWithText:(NSString *)text
                    normalImage:(UIImage *)normalImage
                  selectedImage:(UIImage *)selectedImage {
    [self setImage:normalImage forState:UIControlStateNormal];
    [self setImage:selectedImage forState:UIControlStateHighlighted];
    [self setImage:selectedImage forState:UIControlStateSelected];
    self.titleLabel.font = FONT(14);
    [self setTitleColor:[WJColor titleColor] forState:UIControlStateNormal];
    [self setTitle:text forState:UIControlStateNormal];
    self.showsTouchWhenHighlighted = NO;
    return self;
}

#pragma mark

+ (UIButton *)wj_buttonWithFont:(UIFont *)font
                 normalColor:(UIColor *)normalColor
                 normalImage:(NSString *)normalImage {
    return [self wj_buttonWithFont:font
                    normalColor:normalColor
                  selectedColor:normalColor
                    normalImage:normalImage
                  selectedImage:normalImage];
}

+ (UIButton *)wj_buttonWithFont:(UIFont *)font
                   normalColor:(UIColor *)normalColor
                 selectedColor:(UIColor *)selectedColor
                   normalImage:(NSString *)normalImage
                 selectedImage:(NSString *)selectedImage {
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = font;
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    [button setBackgroundImage:[UIImage imageNamed:normalImage] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    return button;
}

@end
