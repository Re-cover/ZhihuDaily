//
//  BeforeStoriesModel.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/2.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "BeforeStoriesModel.h"
#import "StoryModel.h"

@implementation BeforeStoriesModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"stories" : @"stories"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"stories" : [StoryModel class]};
}

@end
