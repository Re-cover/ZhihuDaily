//
//  ImageScrollView.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/5.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TopStoryModel;
@class TopImageView;

@interface ImageScrollView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *imageScrollView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) NSMutableArray <TopImageView *> *topImageViews;

@property (nonatomic, strong) NSMutableArray<TopStoryModel *> *topStoryModels;

@end
