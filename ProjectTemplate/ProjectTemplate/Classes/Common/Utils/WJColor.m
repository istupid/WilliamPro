//
//  WJColor.m
//
//  Created by William on 11/9/14.
//  Copyright © 2014 William. All rights reserved.
//

#import "WJColor.h"
#import "UIColor+WJColor.h"
#import "NSString+WJFoundation.h"

//UIColor *const kDefaultTextColor = [WJColor titleColor];

#define WJCOLORDEFINEVALUE(__name__, __value__)                                                                       \
  +(UIColor *)__name__ {                                                                                               \
    static UIColor *color;                                                                                             \
    static dispatch_once_t onceToken;                                                                                  \
    dispatch_once(&onceToken, ^{                                                                                       \
      color = __value__;                                                                                               \
    });                                                                                                                \
    return color;                                                                                                      \
  }

#define WJCOLORDEFINEHEX(__name__, __hex__) WJCOLORDEFINEVALUE(__name__, WJColorFromRGB(__hex__))

@implementation WJColor

WJCOLORDEFINEHEX(color33, 0x333333)
WJCOLORDEFINEHEX(color66, 0x666666)
WJCOLORDEFINEHEX(color99, 0x999999)
WJCOLORDEFINEHEX(colorBB, 0xbbbbbb)
WJCOLORDEFINEHEX(colorCC, 0xcccccc)
WJCOLORDEFINEHEX(colorDD, 0xdddddd)
WJCOLORDEFINEHEX(colorEE, 0xeeeeee)
WJCOLORDEFINEHEX(colorFF, 0xffffff)
WJCOLORDEFINEHEX(colorF5, 0xf5f5f5)

WJCOLORDEFINEHEX(elemeBlueColor, 0x0096ff)
WJCOLORDEFINEHEX(elemeOrangeColor, 0xff6000)
WJCOLORDEFINEHEX(elemeRedColor, 0xd83f34)
WJCOLORDEFINEHEX(elemeGreenColor, 0x56d176)

WJCOLORDEFINEHEX(backgroundColor, 0xf5f5f5)
WJCOLORDEFINEHEX(searchBarBackgroundColor, 0xeaeaef)
WJCOLORDEFINEHEX(titleColor, 0)
WJCOLORDEFINEHEX(disabledTextColor, 0xc8c8ce)
WJCOLORDEFINEHEX(selectedCellBackgroundColor, 0xf6f6f8)
WJCOLORDEFINEHEX(textRedColor, 0xff5340)
WJCOLORDEFINEVALUE(separatorColor, self.colorEE)
WJCOLORDEFINEVALUE(navigationBarColor, [self.elemeBlueColor colorWithAlphaComponent:0.99])
WJCOLORDEFINEVALUE(navigationBarTitleColor, UIColor.whiteColor)
WJCOLORDEFINEVALUE(detailTextColor, self.color66)
WJCOLORDEFINEVALUE(lightTitleColor, self.color99)
WJCOLORDEFINEVALUE(buttonDisabledColor, [self.color99 colorWithAlphaComponent:0.5])
WJCOLORDEFINEVALUE(textLightGreyColor, self.colorBB)
WJCOLORDEFINEVALUE(emptyViewTitleColor, self.color33)
WJCOLORDEFINEVALUE(emptyViewSubTitleColor, self.detailTextColor)

+ (UIColor *)colorWithCode:(NSString *)code {
  if ([NSString wj_isBlank:code]) {
    return nil;
  } else if ([code isEqualToString:@"blue"]) {
    return [self elemeBlueColor];
  } else if ([code isEqualToString:@"green"]) {
    return [self elemeGreenColor];
  } else if ([code isEqualToString:@"red"]) {
    return [self elemeRedColor];
  } else if ([code isEqualToString:@"orange"]) {
    return [self elemeOrangeColor];
  } else if ([code isEqualToString:@"black"]) {
    return [self color33];
  } else if ([code isEqualToString:@"grey1"]) {
    return [self color66];
  } else if ([code isEqualToString:@"grey2"]) {
    return [self color99];
  } else {
    return [UIColor wj_colorFromHexString:code];
  }
}

@end
