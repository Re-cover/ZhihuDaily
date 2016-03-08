
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
#import "StoryDetailWebView.h"

#import "ApiRequest.h"
#import <Masonry.h>
#import <SafariServices/SafariServices.h>

@interface StoryDetailViewController()

@property (nonatomic, strong) StoryDetailModel *model;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) TopImageView *topImageView;

@property (nonatomic, strong) StoryDetailWebView *webView;

@end

@implementation StoryDetailViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setHidden:YES];
    self.automaticallyAdjustsScrollViewInsets = NO;   //设置坐标原点为（0，0）
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:self.scrollView];
    
    self.webView = [[StoryDetailWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.scrollView addSubview:self.webView];
    
    self.topImageView = [[TopImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    [self.scrollView addSubview: self.topImageView];
    
    //[self layoutPageSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setDelegate:self];
    [self.navigationController.interactivePopGestureRecognizer setDelegate:self];
    [self.scrollView setDelegate:self];
    [self.webView setDelegate:self];
    
    @weakify(self);
    [ApiRequest storyDetailModelWithParameter:self.storyId complete:^(StoryDetailModel *model) {
        weak_self.model = model;
        weak_self.topImageView.storyDetailModel = model;
        weak_self.webView.model = model;
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

#pragma mark - UIWebView Delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    CGSize webSize= [webView sizeThatFits:CGSizeZero];
    [self.scrollView setContentSize:webSize];
    [self.webView setFrame:CGRectMake(0, 0, webSize.width, webSize.height)];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSURL *url = [request URL];
    if (([[url scheme] isEqualToString:@"http"] || [[url scheme] isEqualToString:@"https"]) && navigationType == UIWebViewNavigationTypeLinkClicked) {
        return ![[UIApplication sharedApplication] openURL:url];
    }
    return YES;
}

#pragma mark - UIScrollView Delegate

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat yOffset = scrollView.contentOffset.y;
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithWhite:1.0 alpha:(yOffset -180) / 20]];
//}


# pragma mark - Private Methods

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

//- (void)layoutPageSubviews {
//    @weakify(self);
//    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(weak_self.view);
//    }];
    
//    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weak_self.view);
//        make.bottom.equalTo(weak_self.view);
//        make.left.equalTo(weak_self.view);
//        make.right.equalTo(weak_self.view);
//    }];
//    
//    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(@200);
//        make.width.mas_equalTo(kScreenWidth);
//        make.top.equalTo(weak_self.view);
//        make.left.equalTo(weak_self.view);
//    }];
//}

@end
