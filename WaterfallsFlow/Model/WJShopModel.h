//
//  WJShopModel.h
//  stream
//
//  Created by William on 2019/6/12.
//  Copyright © 2019 William. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WJShopModel : NSObject

@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger width;

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *price;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)shopWithDict:(NSDictionary *)dict;

+ (NSArray *)shopWithPlistFileName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
