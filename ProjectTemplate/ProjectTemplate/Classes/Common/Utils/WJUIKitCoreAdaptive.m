//
//  WJUIKitCoreAdaptive.m
//
//  Created by William on 5/17/16.
//  Copyright © 2016 William. All rights reserved.
//

#import "WJUIKitCoreAdaptive.h"

NSString *const WJUIKitCoreName = @"WJUIKitCore";

CGFloat WJScreenWidth(WJScaleReferenceDevice referenceDevice) {
  switch (referenceDevice) {
    case WJScaleReferenceDevice6:
      return 375.f;
      break;
      
    case WJScaleReferenceDevice4:
      return 320.f;
      break;
      
    default:
      NSCAssert(NO, @"referenceDevice not valid");
      return 375.f;
      break;
  }
}

CGFloat WJScreenHeight(WJScaleReferenceDevice referenceDevice) {
  switch (referenceDevice) {
    case WJScaleReferenceDevice6:
      return 667.f;
      break;
      
    case WJScaleReferenceDevice4:
      return 480.f;
      break;
      
    default:
      NSCAssert(NO, @"referenceDevice not valid");
      return 667.f;
      break;
  }
}

CGFloat WJHorizontallyScaledValue(CGFloat originalValue, WJScaleReferenceDevice referenceDevice) {
  return originalValue * [UIScreen mainScreen].bounds.size.width / WJScreenWidth(referenceDevice);
}

CGFloat WJHorizScale6(CGFloat originalValue) {
  return WJHorizontallyScaledValue(originalValue, WJScaleReferenceDevice6);
}

CGFloat WJVerticallyScaledValue(CGFloat originalValue, WJScaleReferenceDevice referenceDevice) {
  return originalValue * [UIScreen mainScreen].bounds.size.height / WJScreenHeight(referenceDevice);
}

CGFloat WJVertScale6(CGFloat originalValue) {
  return WJVerticallyScaledValue(originalValue, WJScaleReferenceDevice6);
}
