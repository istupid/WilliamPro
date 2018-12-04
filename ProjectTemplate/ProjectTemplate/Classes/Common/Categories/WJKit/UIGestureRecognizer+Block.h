//
//  UIGestureRecognizer+Block.h
//
//  Created by William on 16/3/15.
//  Copyright © 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^WJGestureBlock)(id gestureRecognizer);

@interface UIGestureRecognizer (Block)

+ (instancetype)wj_gestureRecognizerWithActionBlock:(WJGestureBlock)block;

@end
