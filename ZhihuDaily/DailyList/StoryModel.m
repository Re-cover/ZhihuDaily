//
//  StoryModel.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/1.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "StoryModel.h"

@implementation StoryModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"storyId" : @"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"images" : [NSString class]};
}

@end
