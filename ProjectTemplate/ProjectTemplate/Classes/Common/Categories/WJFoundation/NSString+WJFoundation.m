//
//  NSString+WJFoundation.m
//
//  Created by William on 7/7/15.
//  Copyright © 2015 William. All rights reserved.
//

#import "NSString+WJFoundation.h"
#import <UIKit/UIKit.h>

@implementation NSString (WJFoundation)

+ (BOOL)wj_isBlank:(NSString *)string {
  return string == nil
  || ![string isKindOfClass:[NSString class]]
  || [string isEqualToString:@""]
  || [[string wj_trimmed] isEqualToString:@""];
}

- (NSString *)wj_trimmed {
  NSCharacterSet *whiteCharSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  return [self stringByTrimmingCharactersInSet:whiteCharSet];
}

+ (NSString *)wj_localizedStringForKey:(NSString *)key {
  return NSLocalizedString(key, nil);
}

+ (NSString *)wj_seperatePhoneBySpace:(NSString *)phone {
  NSMutableString *formatedPhone = [NSMutableString string];
  for (int i = 0; i < phone.length; i++) {
    [formatedPhone appendFormat:@"%C", [phone characterAtIndex:i]];
    if (i == 2 || i == 6) {
      [formatedPhone appendString:@" "];
    }
  }
  return formatedPhone;
}

+ (NSString *)wj_securePhone:(NSString *)phone {
  return [phone stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
}

+ (NSString *)wj_seperatePhoneByLine:(NSString *)phone {
  if ([phone rangeOfString:@"-"].location != NSNotFound) {
    return phone;
  }
  NSMutableString *result = [NSMutableString stringWithString:phone];
  if (phone.length == 11) {
    [result insertString:@"-" atIndex:3];
    [result insertString:@"-" atIndex:8];
  }

  return result;
}

+ (BOOL)wj_isPhone:(NSString *)phoneString {
  NSString *newPhoneString = [self wj_removeString:phoneString bySubStrings:@[@" ", @"-"]];
  if (newPhoneString.length < 7) return NO;
  return [[[NSNumberFormatter alloc] init] numberFromString:newPhoneString] != nil;
}

+ (BOOL)wj_isMobileNumber:(NSString *)phoneString {
  NSString *newPhoneString = [self wj_removeString:phoneString bySubStrings:@[@" ", @"-"]];
  NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^1\\d{10}$"];
  return [regextestmobile evaluateWithObject:newPhoneString];
}

+ (NSString *)wj_removeString:(NSString *)source bySubStrings:(NSArray *)subStrings {
  NSMutableString *string = [NSMutableString stringWithString:source];
  for (id object in subStrings) {
    if ([object isKindOfClass:[NSString class]] || [object isKindOfClass:[NSMutableString class]]) {
      NSRange range = {0, [string length]};
      [string replaceOccurrencesOfString:object withString:@"" options:NSCaseInsensitiveSearch range:range];
    }
  }
  return string;
}

+ (BOOL)wj_isPureInt:(NSString*)string {
  NSScanner *scan = [NSScanner scannerWithString:string];
  int val;
  return [scan scanInt:&val] && [scan isAtEnd];
}

+ (BOOL)wj_isNumberic:(NSString *)string {
  NSScanner *sc = [NSScanner scannerWithString:string];
  if ([sc scanFloat:NULL]) {
    return [sc isAtEnd];
  }
  return NO;
}

+ (NSAttributedString *)wj_attributedStringWithHtmlString:(NSString *)string {
  NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                            NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)};
  NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
  NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:data
                                                                          options:options
                                                               documentAttributes:nil
                                                                            error:nil];
  return attributedString;
}

@end
