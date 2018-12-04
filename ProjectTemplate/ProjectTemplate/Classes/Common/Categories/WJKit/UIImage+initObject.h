//
//  UIImage+initObject.h
//  Car_Hi
//
//  Created by William on 2017/9/4.
//  Copyright © 2017年 com.Risk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (initObject)

// 渐变图片
+ (UIImage *)gradientImageWithColors:(NSArray <UIColor *> *)colors size:(CGSize)size;

// 纯色图片
+ (UIImage *)wj_imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)wj_imageWithSize:(CGSize)size;

- (UIImage *)imageTintedWithColor:(UIColor *)color;

- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction;

@end
