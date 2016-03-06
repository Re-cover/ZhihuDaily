//
//  SplashView.m
//  ZhihuDaily
//
//  Created by Recover on 16/2/27.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "SplashView.h"

@implementation SplashView

//懒加载

- (UIImageView *)backgroundImageView {
    if(!_backgroundImageView) {
        self.backgroundImageView = [[UIImageView alloc] init];
        [self.backgroundImageView setBackgroundColor:[UIColor darkGrayColor]];
    }
    return _backgroundImageView;
}

- (UIImageView *)logoImageView {
    if(!_logoImageView) {
        self.logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Splash_Logo_Plus.jpg"]];
        [self.logoImageView setContentMode:UIViewContentModeCenter];
    }
    return _logoImageView;
}

- (UILabel *)copyrightLabel {
    if (!_copyrightLabel) {
        self.copyrightLabel = [[UILabel alloc] init];
        [self.copyrightLabel setText:@""];
        [self.copyrightLabel setTextAlignment:NSTextAlignmentCenter];
        [self.copyrightLabel setTextColor:[UIColor whiteColor]];
        [self.copyrightLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:11]];
    }
    return _copyrightLabel;
}

@end
