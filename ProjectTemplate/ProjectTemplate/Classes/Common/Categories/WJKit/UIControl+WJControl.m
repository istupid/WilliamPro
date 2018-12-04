//
//  UIControl+WJControl.m
//
//  Created by William on 5/21/15.
//  Copyright © 2015 William. All rights reserved.
//

#import "UIControl+WJControl.h"
#import <objc/runtime.h>

@implementation UIControl (WJControl)

- (void)wj_addTarget:(id)target action:(SEL)action {
  [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)wj_addEventHandler:(void (^)(void))handler {
  [self wj_addEventHandler:handler forControlEvents:UIControlEventTouchUpInside];
}

static char WJControlHandlerKey;
- (void)wj_addEventHandler:(void (^)(void))handler forControlEvents:(UIControlEvents)controlEvents {
  objc_setAssociatedObject(self, &WJControlHandlerKey, handler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  [self addTarget:self action:@selector(wj_didTappedButton) forControlEvents:controlEvents];
}

- (void)wj_didTappedButton {
  void (^handler)(void) = objc_getAssociatedObject(self, &WJControlHandlerKey);
  if (handler) {
    handler();
  }
}

@end
