//
//  UIGestureRecognizer+Block.m
//
//  Created by William on 16/3/15.
//  Copyright © 2015 William. All rights reserved.
//

#import "UIGestureRecognizer+Block.h"
#import <objc/runtime.h>

@interface WJGestureRecognizerBlockTarget : NSObject

@property (nonatomic, copy) WJGestureBlock block;

- (id)initWithBlock:(WJGestureBlock)block;
- (void)invoke:(id)sender;

@end

@implementation WJGestureRecognizerBlockTarget

- (id)initWithBlock:(WJGestureBlock)block {
  self = [super init];
  if (self) {
    _block = [block copy];
  }
  return self;
}

- (void)invoke:(id)sender {
  if (self.block) {
    self.block(sender);
  }
}

@end


static const int target_key;

@implementation UIGestureRecognizer (Block)

+ (instancetype)wj_gestureRecognizerWithActionBlock:(WJGestureBlock)block {
  return [[self alloc] initWithActionBlock:block];
}

- (instancetype)initWithActionBlock:(WJGestureBlock)block {
  self = [self init];
  WJGestureRecognizerBlockTarget *target = objc_getAssociatedObject(self, &target_key);
  if (!target) {
    target = [[WJGestureRecognizerBlockTarget alloc] initWithBlock:block];
    objc_setAssociatedObject(self, &target_key, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }
  [self addTarget:target action:@selector(invoke:)];
  return self;
}

@end
