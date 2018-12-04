//
//  UIColor+WJColor.h
//
//  Created by William on 7/1/15.
//  Copyright © 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CLEAR_COLOR [UIColor clearColor]

extern UIColor* COLOR(unsigned c);
extern UIColor* WJColorFromRGB(unsigned rgbValue);
extern UIColor* WJColorFromRGBA(unsigned rgbValue,CGFloat alphaValue);
extern UIColor* RGBCOLOR(unsigned r, unsigned g, unsigned b);
extern UIColor* RGBACOLOR(unsigned r,unsigned g,unsigned b,CGFloat a);


@interface UIColor (WJColor)

+ (UIColor *)wj_colorFromCommaSeparatedString:(NSString *)commaSeparatedString;

+ (UIColor *)wj_colorFromHexString:(NSString *)hexString;

- (NSUInteger)wj_approximateHash;

- (NSString *)hexStringWithAlpha:(BOOL)withAlpha;

@end
