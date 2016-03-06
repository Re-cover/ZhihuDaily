//
//  LatestStoriesModel.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/1.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "LatestStoriesModel.h"
#import "StoryModel.h"
#import "TopStoryModel.h"

@implementation LatestStoriesModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"stories" : @"stories",
             @"topStories" : @"top_stories"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"stories" : [StoryModel class],
             @"topStories" : [TopStoryModel class]};
}

@end
