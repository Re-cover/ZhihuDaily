//
//  TopImageView.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/5.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopStoryModel;
@class StoryDetailModel;

@interface TopImageView : UIView

@property (nonatomic, strong) UIImageView *topStoryImage;

@property (nonatomic, strong) UILabel *topStoryTitleLabel;

@property (nonatomic, strong) UIImageView *maskImageView;

@property (nonatomic, strong) UILabel *imageSourceLabel;

@property (nonatomic, strong) TopStoryModel *topStoryModel;

@property (nonatomic, strong) StoryDetailModel *storyDetailModel;

@end
