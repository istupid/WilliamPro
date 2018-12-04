//
//  UIButton+CustomStyle.m
//
//  Created by William on 02/11/2016.
//  Copyright © 2016 com.Risk. All rights reserved.
//

#import "UIButton+CustomStyle.h"
#import "WJFont.h"
#import "WJColor.h"

@implementation UIButton (CustomStyle)

- (void)_dealTextImageRelativeStyle:(WJButtonCustomStyle)style
                                 space:(CGFloat)space {
    CGFloat imageWidth  = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
    
    CGFloat titleWidth  = self.titleLabel.intrinsicContentSize.width;
    CGFloat titleHeight = self.titleLabel.intrinsicContentSize.height;
    
    switch (style) {
        case WJButtonCustomStyleTop: {
            self.imageEdgeInsets = UIEdgeInsetsMake(- (titleHeight + space), 0, 0, - titleWidth);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageWidth, - (imageHeight + space), 0);
        } break;
            
        case WJButtonCustomStyleLeading: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space, 0, space);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space, 0, -space);
        } break;
            
        case WJButtonCustomStyleBottom: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, - (titleHeight + space), - titleWidth);
            self.titleEdgeInsets = UIEdgeInsetsMake(- (imageHeight + space), - imageWidth, 0, 0);
        } break;
            
        case WJButtonCustomStyleTrailing: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth + space, 0, - (titleWidth + space));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - (imageWidth + space), 0, imageWidth + space);
        } break;
            
        default:
            break;
    }
}

+ (UIButton *)buttonWithImage:(NSString *)image
                         text:(NSString *)text
                        style:(WJButtonCustomStyle)style {
    return [self buttonWithImage:image text:text font:FONT(14)
                           style:style];
}

+ (UIButton *)buttonWithImage:(NSString *)image
                         text:(NSString *)text
                         font:(UIFont *)font
                        style:(WJButtonCustomStyle)style {
    return [self buttonWithImage:image text:text font:font
                           color:[WJColor titleColor] style:style];
}


+ (UIButton *)buttonWithImage:(NSString *)image
                         text:(NSString *)text
                         font:(UIFont *)font
                        color:(UIColor *)color
                        style:(WJButtonCustomStyle)style {
    return [self buttonWithImage:image text:text font:font
                           color:color space:0.5 style:style];
}

+ (UIButton *)buttonWithImage:(NSString *)image
                         text:(NSString *)text
                         font:(UIFont *)font
                        color:(UIColor *)color
                        space:(CGFloat)space
                        style:(WJButtonCustomStyle)style
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = font;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn _dealTextImageRelativeStyle:style space:space];
    return btn;
}


#pragma mark - 网络加载图片和文字

+ (UIButton *)buttonWithFont:(UIFont *)font
                       color:(UIColor *)color
                       space:(CGFloat)space
                       stype:(WJButtonCustomStyle)style
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = font;
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn _dealTextImageRelativeStyle:style space:space];
    return btn;
}


+ (UIButton *)buttonWithRect:(CGRect)rect
                       image:(NSString *)image
                        text:(NSString *)text
                        font:(UIFont *)font
                       color:(UIColor *)color
                       space:(CGFloat)space
                       style:(WJButtonCustomStyle)style {
    UIButton *btn = [self buttonWithImage:image text:text font:font
                                    color:color space:space style:style];
    btn.frame = rect;
    return btn;
}

- (void)calculateImageTextSpace:(CGFloat)space style:(WJButtonCustomStyle)style {
    [self _dealTextImageRelativeStyle:style space:space];
}

@end
