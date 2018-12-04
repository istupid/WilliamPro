//
//  UIImage+initObject.m
//  Car_Hi
//
//  Created by William on 2017/9/4.
//  Copyright © 2017年 com.Risk. All rights reserved.
//

#import "UIImage+initObject.h"

@implementation UIImage (initObject)

#pragma gradient image 渐变图片

+ (UIImage *)gradientImageWithColors:(NSArray<UIColor *> *)colors size:(CGSize)size {
    NSMutableArray *mArray = [NSMutableArray array];
    for (UIColor *color in colors) {
        [mArray addObject:(id)color.CGColor];
    }
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace(colors.lastObject.CGColor);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)mArray, NULL);
    CGContextDrawLinearGradient(context, gradient, CGPointZero, CGPointMake(0, size.height),
                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
//    CGColorSpaceRelease(colorSpace);
    CGContextRestoreGState(context);
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)wj_imageWithColor:(UIColor *)color size:(CGSize)size {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
    CGContextRestoreGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (UIImage *)wj_imageWithSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (UIImage *)imageTintedWithColor:(UIColor *)color
{
    // This method is designed for use with template images, i.e. solid-coloured mask-like images.
    return [self imageTintedWithColor:color fraction:0.0]; // default to a fully tinted mask of the image.
}


- (UIImage *)imageTintedWithColor:(UIColor *)color fraction:(CGFloat)fraction
{
    if (color) {
        // Construct new image the same size as this one.
        UIImage *image;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0) {
            UIGraphicsBeginImageContextWithOptions([self size], NO, 0.0); // 0.0 for scale means "scale for device's main screen".
        }
#else
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 4.0) {
            UIGraphicsBeginImageContext([self size]);
        }
#endif
        CGRect rect = CGRectZero;
        rect.size = [self size];
        
        // Composite tint color at its own opacity.
        [color set];
        UIRectFill(rect);
        
        // Mask tint color-swatch to this image's opaque mask.
        // We want behaviour like NSCompositeDestinationIn on Mac OS X.
        [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
        
        // Finally, composite this image over the tinted mask at desired opacity.
        if (fraction > 0.0) {
            // We want behaviour like NSCompositeSourceOver on Mac OS X.
            [self drawInRect:rect blendMode:kCGBlendModeSourceAtop alpha:fraction];
        }
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;
    }
    
    return self;
}

@end
