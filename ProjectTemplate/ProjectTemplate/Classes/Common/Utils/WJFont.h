//
//  WJFont.h
//
//  Created by William on 1/7/15.
//  Copyright © 2015 William. All rights reserved.
//

@import UIKit;

extern UIFont *FONT(CGFloat size);
extern UIFont *BOLD_FONT(CGFloat size);

@interface WJFont : NSObject

+ (UIFont *)grandTitleFont;

+ (UIFont *)titleFont;

+ (UIFont *)mediumTitleFont;

+ (UIFont *)smallTitleFont;

+ (UIFont *)detailFont;

+ (UIFont *)smallFont;

+ (UIFont *)navigationBarTitleFont;

+ (UIFont *)navigationBarItemFont;

+ (UIFont *)segmentControlTitleFont;

+ (UIFont *)emptyViewTitleFont;

+ (UIFont *)emptyViewSubTitleFont;

@end
