//
//  ThemeStoriesModel.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "ThemeStoriesModel.h"
#import "ThemeStoryModel.h"
#import "ThemeEditorModel.h"

@implementation ThemeStoriesModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"themeDescription" : @"description"};
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"stories" :[ThemeStoryModel class],
             @"editors" : [ThemeEditorModel class]};
}

@end
