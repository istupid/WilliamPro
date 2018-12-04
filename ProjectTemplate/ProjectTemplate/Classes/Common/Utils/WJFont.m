//
//  WJFont.m
//
//  Created by William on 1/7/15.
//  Copyright © 2015 William. All rights reserved.
//

#import "WJFont.h"

@implementation WJFont

+ (UIFont *)grandTitleFont {
  return [UIFont systemFontOfSize:19];
}

+ (UIFont *)titleFont {
  return [UIFont systemFontOfSize:16];
}

+ (UIFont *)mediumTitleFont {
  return [UIFont systemFontOfSize:13];
}

+ (UIFont *)smallTitleFont {
  return [UIFont systemFontOfSize:12];
}

+ (UIFont *)detailFont {
  return [UIFont systemFontOfSize:14];
}

+ (UIFont *)smallFont {
  return [UIFont systemFontOfSize:11];
}

+ (UIFont *)navigationBarTitleFont {
  return [UIFont boldSystemFontOfSize:19.0];
}

+ (UIFont *)navigationBarItemFont {
  return [UIFont systemFontOfSize:16];
}

+ (UIFont *)segmentControlTitleFont {
  return [UIFont boldSystemFontOfSize:14];
}

+ (UIFont *)emptyViewTitleFont {
  return [UIFont systemFontOfSize:20];
}

+ (UIFont *)emptyViewSubTitleFont {
  return [self detailFont];
}

@end

UIFont *FONT(CGFloat size) {
  return [UIFont systemFontOfSize:size];
}

UIFont *BOLD_FONT(CGFloat size) {
  return  [UIFont boldSystemFontOfSize:size];
}
