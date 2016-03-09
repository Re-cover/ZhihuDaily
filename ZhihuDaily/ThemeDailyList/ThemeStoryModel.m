//
//  ThemeStoryModel.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "ThemeStoryModel.h"

@implementation ThemeStoryModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"id" : @"themeStoryId"};
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"images" : [NSString class]};
}

@end
