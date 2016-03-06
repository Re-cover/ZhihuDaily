//
//  ImageScrollView.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/5.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "ImageScrollView.h"
#import "TopStoryModel.h"
#import "TopImageView.h"
#import <Masonry.h>
#import <YYWebImage.h>

#define weakify(object) autoreleasepool{} __weak typeof(object) weak_##object = object;
#define kScreenWidth         [UIScreen mainScreen].bounds.size.width
#define kScreenHeight        [UIScreen mainScreen].bounds.size.height

@implementation ImageScrollView

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 200)];
    if (self) {
        @weakify(self);
        [self addSubview:self.imageScrollView];
        [self.imageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weak_self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [self addSubview:self.pageControl];
        [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 16));
            make.centerX.mas_equalTo(weak_self);
            make.bottom.mas_equalTo(weak_self).offset(-14);
        }];
    }
    return self;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.x;
    self.pageControl.currentPage = (NSInteger)(offset / kScreenWidth + 0.5);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat x = self.pageControl.currentPage * kScreenWidth;
    [self.imageScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    [self addTimer];
}

- (UIScrollView *)imageScrollView {
    if (!_imageScrollView) {
        self.imageScrollView = [[UIScrollView alloc] init];
        [self.imageScrollView setPagingEnabled:YES];
        [self.imageScrollView setBounces:NO];
        [self.imageScrollView setShowsHorizontalScrollIndicator:NO];
    }
    return _imageScrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        self.pageControl = [[UIPageControl alloc] init];
    }
    return _pageControl;
}

- (void)addTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(scorllToNextImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)removeTimer {
    [self.timer invalidate];
}

- (void)scorllToNextImage {
//    NSLog(@"翻页");
    NSLog(@"%ld", self.pageControl.currentPage);
    NSInteger page = (self.pageControl.currentPage + 1) % 5;
    CGFloat x = page * kScreenWidth;
    [self.imageScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)setTopStoryModels:(NSMutableArray<TopStoryModel *> *)topStoryModels {
    _topStoryModels = topStoryModels;
    for (TopImageView *imageView in self.topImageViews) {
        [imageView removeFromSuperview];
    }
    [self.topImageViews removeAllObjects];
    
    [self.pageControl setNumberOfPages:topStoryModels.count];
    for (NSUInteger i = 0; i < topStoryModels.count; i++) {
        TopImageView *imageView = [[TopImageView alloc] init];
        imageView.model = topStoryModels[i];
        [self.topImageViews addObject:imageView];
        [self.imageScrollView addSubview:imageView];
    }
    if (self.timer) {
        [self removeTimer];
    }
    [self addTimer];
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageScrollView.contentSize = CGSizeMake(kScreenWidth * self.topImageViews.count, self.frame.size.height);
    for (NSUInteger i = 0; i < self.topStoryModels.count; i++) {
        TopImageView *imageVew = self.topImageViews[i];
        imageVew.frame = CGRectMake(i*kScreenWidth, 0, kScreenWidth, self.frame.size.height);
    }
}

@end
