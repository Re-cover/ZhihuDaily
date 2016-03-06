//
//  BeforeStoriesModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/2.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@class StoryModel;

@interface BeforeStoriesModel : NSObject<YYModel>

@property (nonatomic, copy) NSString *date;

@property (nonatomic, strong) NSArray<StoryModel *> *stories;

@end
