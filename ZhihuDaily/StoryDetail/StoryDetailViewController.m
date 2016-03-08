
//
//  StoryDetailViewController.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/7.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "StoryDetailViewController.h"
#import "StoryDetailModel.h"

#import "TopImageView.h"
#import "StoryDetailScorllView.h"

#import "ApiRequest.h"
#import <Masonry.h>

@interface StoryDetailViewController()

@property (nonatomic, strong) StoryDetailModel *model;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) TopImageView *topImageView;

@end

@implementation StoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setDelegate:self];
    [self.navigationController.interactivePopGestureRecognizer setDelegate:self];
    [self.scrollView setDelegate:self];
    
    self.scrollView = [[StoryDetailScorllView alloc] init];
    [self.view addSubview:self.scrollView];
    
    self.topImageView = [[TopImageView alloc] init];
    [self.scrollView addSubview: self.topImageView];
    
    [self layoutPageSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    @weakify(self);
    [ApiRequest storyDetailModelWithParameter:self.storyId complete:^(StoryDetailModel *model) {
        weak_self.model = model;
        weak_self.topImageView.storyDetailModel = model;
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController setDelegate:nil];
}

#pragma mark - UINavigationController Delegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        [navigationController.interactivePopGestureRecognizer setEnabled:YES];
    }
}


# pragma mark - Private Methods

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)layoutPageSubviews {
    @weakify(self);
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weak_self.view);
    }];
    
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@200);
        make.top.equalTo(weak_self.view);
        make.left.equalTo(weak_self.view);
        make.right.equalTo(weak_self.view);
    }];
}

@end
