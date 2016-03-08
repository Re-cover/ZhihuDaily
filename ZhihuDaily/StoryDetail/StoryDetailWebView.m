//
//  StoryDetailWebView.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/7.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "StoryDetailWebView.h"
#import "StoryDetailModel.h"

@implementation StoryDetailWebView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.scrollView setScrollEnabled:NO];
    }
    return self;
}

- (void)setModel:(StoryDetailModel *)model {
    _model = model;
    NSString *html = [NSString stringWithFormat:@"<link rel=\"Stylesheet\" type=\"text/css\" href=\"%@\" />%@", [model.css firstObject], model.body];
    [self loadHTMLString:html baseURL:nil];
}

@end
