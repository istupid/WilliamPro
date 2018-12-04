//
//  UIControl+WJControl.h
//
//  Created by William on 5/21/15.
//  Copyright © 2015 William. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (WJControl)

- (void)wj_addTarget:(id)target action:(SEL)action;

- (void)wj_addEventHandler:(void (^)(void))handler;

- (void)wj_addEventHandler:(void (^)(void))handler
          forControlEvents:(UIControlEvents)controlEvents;

@end

NS_ASSUME_NONNULL_END
