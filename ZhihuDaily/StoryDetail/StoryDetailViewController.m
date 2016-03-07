
//
//  StoryDetailViewController.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/7.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "StoryDetailViewController.h"

@implementation StoryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setDelegate:self];
    [self.navigationController.interactivePopGestureRecognizer setDelegate:self];
    NSLog(@"%@", self.storyId);
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

@end
