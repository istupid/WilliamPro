//
//  UIColor+WJColor.m
//
//  Created by William on 7/1/15.
//  Copyright © 2015 William. All rights reserved.
//

#import "UIColor+WJColor.h"

@implementation UIColor (WJColor)

+ (UIColor *)wj_colorFromCommaSeparatedString:(NSString *)commaSeparatedString {
  NSArray *colors = [commaSeparatedString componentsSeparatedByString:@","];
  if (colors.count != 3) {
    return [UIColor clearColor];
  }
  return RGBCOLOR([colors[0] intValue], [colors[1] intValue], [colors[2] intValue]);
}

+ (UIColor *)wj_colorFromHexString:(NSString *)hexString {
  if (hexString.length < 6 || hexString.length > 7) {
    return [UIColor clearColor];
  }
  NSScanner *scanner = [NSScanner scannerWithString:hexString];
  if (hexString.length == 7) {
    scanner.scanLocation = 1;
  }
  uint color;
  [scanner scanHexInt:&color];
  return WJColorFromRGB(color);
}

// http://nshipster.com/equality/
- (NSUInteger)wj_approximateHash {
  CGFloat red, green, blue;
  [self getRed:&red green:&green blue:&blue alpha:nil];
  return ((NSUInteger)(red * 255) << 16) + ((NSUInteger)(green * 255) << 8) + (NSUInteger)(blue * 255);
}

- (NSString *)hexStringWithAlpha:(BOOL)withAlpha {
  CGColorRef color = self.CGColor;
  size_t count = CGColorGetNumberOfComponents(color);
  const CGFloat *components = CGColorGetComponents(color);
  static NSString *stringFormat = @"%02x%02x%02x";
  NSString *hex = nil;
  if (count == 2) {
    NSUInteger white = (NSUInteger)(components[0] * 255.0f);
    hex = [NSString stringWithFormat:stringFormat, white, white, white];
  } else if (count == 4) {
    hex = [NSString stringWithFormat:stringFormat,
           (NSUInteger)(components[0] * 255.0f),
           (NSUInteger)(components[1] * 255.0f),
           (NSUInteger)(components[2] * 255.0f)];
  }
  
  if (hex && withAlpha) {
    hex = [hex stringByAppendingFormat:@"%02lx",
           (unsigned long)(CGColorGetAlpha(self.CGColor) * 255.0 + 0.5)];
  }
  return hex;
}

@end


#pragma mark - C function

UIColor *COLOR(unsigned c) {
  return [UIColor colorWithRed:(CGFloat)c / 255.0
                         green:(CGFloat)c / 255.0
                          blue:(CGFloat)c / 255.0
                         alpha:1];
}

UIColor *WJColorFromRGB(unsigned rgbValue) {
  return WJColorFromRGBA(rgbValue, 1.0);
}

UIColor *WJColorFromRGBA(unsigned rgbValue, CGFloat alphaValue) {
  return [UIColor colorWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0
                         green:((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0
                          blue:((CGFloat)(rgbValue & 0xFF)) / 255.0
                         alpha:(alphaValue)];
}

UIColor *RGBCOLOR(unsigned r, unsigned g, unsigned b) {
  return RGBACOLOR(r, g, b, 1);
}

UIColor *RGBACOLOR(unsigned r, unsigned g, unsigned b, CGFloat a) {
  return [UIColor colorWithRed:(CGFloat)r / 255.0
                         green:(CGFloat)g / 255.0
                          blue:(CGFloat)b / 255.0
                         alpha:a];
}
