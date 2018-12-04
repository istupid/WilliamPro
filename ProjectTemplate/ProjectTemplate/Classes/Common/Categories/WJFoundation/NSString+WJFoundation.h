//
//  NSString+WJFoundation.h
//
//  Created by William on 7/7/15.
//  Copyright © 2015 William. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WJFoundation)

+ (BOOL)wj_isBlank:(NSString *)string;

- (NSString *)wj_trimmed;

+ (NSString *)wj_localizedStringForKey:(NSString *)key;

+ (NSString *)wj_securePhone:(NSString *)phone;

+ (NSString *)wj_seperatePhoneBySpace:(NSString *)phone;

+ (NSString *)wj_seperatePhoneByLine:(NSString *)phone;

+ (BOOL)wj_isPureInt:(NSString*)string;

+ (BOOL)wj_isNumberic:(NSString *)string;

+ (BOOL)wj_isPhone:(NSString *)phoneString;

+ (BOOL)wj_isMobileNumber:(NSString *)phoneString;

+ (NSAttributedString *)wj_attributedStringWithHtmlString:(NSString *)string;

@end
