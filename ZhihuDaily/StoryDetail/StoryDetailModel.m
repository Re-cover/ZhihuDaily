//
//  StoryDetailModel.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/7.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "StoryDetailModel.h"
#import "SectionModel.h"

@implementation StoryDetailModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"sectionId" : @"id"};
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"setcion" : [SectionModel class],
             @"css" : [NSString class]};
    
}
@end
