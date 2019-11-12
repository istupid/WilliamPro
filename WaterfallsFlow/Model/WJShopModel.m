//
//  WJShopModel.m
//  stream
//
//  Created by William on 2019/6/12.
//  Copyright © 2019 William. All rights reserved.
//

#import "WJShopModel.h"

@implementation WJShopModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)shopWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)shopWithPlistFileName:(NSString *)fileName {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]];
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [mArray addObject:[[self alloc] initWithDict:dict]];
    }
    return mArray.copy;
}

@end
