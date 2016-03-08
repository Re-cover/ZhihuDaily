//
//  StoryDetailScorllView.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/8.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "StoryDetailScorllView.h"

@implementation StoryDetailScorllView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setShowsHorizontalScrollIndicator:NO];
        [self setAlwaysBounceHorizontal:NO];
    }
    return self;
}

@end
