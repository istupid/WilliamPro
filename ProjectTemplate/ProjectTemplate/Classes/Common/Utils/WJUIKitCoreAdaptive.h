//
//  WJUIKitCoreAdaptive.h
//
//  Created by William on 5/17/16.
//  Copyright © 2016 William. All rights reserved.
//

@import UIKit;


#define SCREEN_SCALE ([UIScreen mainScreen].scale)
#define POINT_OF_ONE_PIXEL (1 / SCREEN_SCALE)

extern NSString * _Nonnull const WJUIKitCoreName;

/// UI 出设计图的基准机型, 用于将标注尺寸等比缩放
typedef NS_ENUM(NSUInteger, WJScaleReferenceDevice) {
    /// UI 以 iPhone 7 为基准的标注
    
    /// UI 以 iPhone 6 为基准的标注
    WJScaleReferenceDevice6,
    /// UI 以 iPhone 4 为基准的标注
    WJScaleReferenceDevice4,
};

/**
 满足 UI 在一些尺寸上根据某机型等比缩放的需求, 这个是根据屏幕宽度.
 
 @param originalValue   UI 给的标注值
 @param referenceDevice UI 用来设计的参考机型
 
 @return 以参考机型为基准, 将标注值根据屏幕宽度等比缩放后的数值
 */
extern CGFloat WJHorizontallyScaledValue(CGFloat originalValue, WJScaleReferenceDevice referenceDevice);

/**
 Horiz -> 以屏幕宽度为基准
 
 6 -> 以 iPhone 6 的尺寸为基准
 
 WJHorizScale6 -> 以 iPhone 6 的尺寸为基准, 按本设备和 iPhone 6 屏幕宽度的比例缩放所给的 value. 也就是 originalValue * DEVICE_FULL_SIZE_WIDTH / 375
 */
extern CGFloat WJHorizScale6(CGFloat originalValue);

/**
 满足 UI 在一些尺寸上根据某机型等比缩放的需求, 这个是根据屏幕高度.
 
 @param originalValue   UI 给的标注值
 @param referenceDevice UI 用来设计的参考机型
 
 @return 以参考机型为基准, 将标注值根据屏幕高度等比缩放后的数值
 */
extern CGFloat WJVerticallyScaledValue(CGFloat originalValue, WJScaleReferenceDevice referenceDevice);

/**
 Vert -> 以屏幕高度为基准
 
 6 -> 以 iPhone 6 的尺寸为基准
 
 WJVertScale6 -> 以 iPhone 6 的尺寸为基准, 按本设备和 iPhone 6 屏幕高度的比例缩放所给的 value. 也就是 originalValue * DEVICE_FULL_SIZE_HEIGHT / 667
 */
extern CGFloat WJVertScale6(CGFloat originalValue);

