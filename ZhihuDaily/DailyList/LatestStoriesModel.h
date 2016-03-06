//
//  LatestStoriesModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/1.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@class StoryModel;
@class TopStoryModel;

@interface LatestStoriesModel : NSObject <YYModel>

@property (nonatomic, copy) NSString *date;

@property (nonatomic, strong) NSArray<StoryModel *> *stories;

@property (nonatomic, strong) NSArray<TopStoryModel *> *topStories;

@end
