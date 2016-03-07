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
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
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

# pragma mark - ScrollDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.x;
    self.pageControl.currentPage = (NSInteger)(offset / kScreenWidth + 0.5);
    //NSLog(@"currentPage %ld", self.pageControl.currentPage);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
    //NSLog(@"remove timer");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat x = self.pageControl.currentPage * kScreenWidth;
    [self.imageScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
    [self addTimer];
    //NSLog(@"add timer");
}

# pragma mark - Getters and Setters

- (UIScrollView *)imageScrollView {
    if (!_imageScrollView) {
        self.imageScrollView = [[UIScrollView alloc] init];
        [self.imageScrollView setPagingEnabled:YES];
        [self.imageScrollView setBounces:NO];
        //        [self.imageScrollView setContentMode:UIViewContentModeScaleAspectFill];
        //        [self.imageScrollView setContentScaleFactor:[[UIScreen mainScreen] scale]];
        //        [self.imageScrollView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        
        [self.imageScrollView setShowsHorizontalScrollIndicator:NO];
        [self.imageScrollView setShowsVerticalScrollIndicator:NO];
        [self.imageScrollView setDelegate:self];
    }
    return _imageScrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        self.pageControl = [[UIPageControl alloc] init];
    }
    return _pageControl;
}

- (void)setTopStoryModels:(NSMutableArray<TopStoryModel *> *)topStoryModels {
    _topStoryModels = topStoryModels;
    for (TopImageView *imageView in self.topImageViews) {
        [imageView removeFromSuperview];
    }
    [self.topImageViews removeAllObjects];
    
    [self.pageControl setNumberOfPages:topStoryModels.count];
    self.imageScrollView.contentSize = CGSizeMake(topStoryModels.count * kScreenWidth, self.imageScrollView.frame.size.height);
    
    for (NSUInteger i = 0; i < topStoryModels.count; i++) {
        TopImageView *imageView = [[TopImageView alloc] init];
        imageView.topStoryModel = topStoryModels[i];
        [self.topImageViews addObject:imageView];
        [self.imageScrollView addSubview:imageView];
        imageView.frame = CGRectMake(i * kScreenWidth, 0, kScreenWidth, imageView.bounds.size.height);
    }
    if (self.timer) {
        [self removeTimer];
    }
    [self addTimer];
}

# pragma mark - Private Methods

- (void)addTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(scorllToNextImage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void)removeTimer {
    [self.timer invalidate];
}

- (void)scorllToNextImage {
    //NSLog(@"%ld", self.pageControl.currentPage);
    NSInteger page = (self.pageControl.currentPage + 1) % self.pageControl.numberOfPages;
    CGFloat x = page * kScreenWidth;
    [self.imageScrollView setContentOffset:CGPointMake(x, 0) animated:YES];
}

@end
