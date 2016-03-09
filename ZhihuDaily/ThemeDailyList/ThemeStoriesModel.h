//
//  ThemeStoriesModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>
@class ThemeStoryModel;
@class ThemeEditorModel;
//{
//    "stories": [
//                ],
//    "description": "有音乐就很好",
//    "background": "http://p1.zhimg.com/02/17/02176dbeefe7f0a54c0563f5533fa4da.jpg",
//    "color": 1564695,
//    "name": "音乐日报",
//    "image": "http://p3.zhimg.com/fb/0c/fb0cafb337fd84bd6a08f5fe1a561401.jpg",
//    "editors": [

//                ],
//    "image_source": ""
//}

@interface ThemeStoriesModel : NSObject <YYModel>

@property (nonatomic, strong) NSMutableArray<ThemeStoryModel *> *stories;

@property (nonatomic, copy) NSString *themeDescription;

@property (nonatomic, copy) NSString *background;

@property (nonatomic, assign) NSInteger *color;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, strong) NSMutableArray<ThemeEditorModel *> *editors;

@property (nonatomic, copy) NSString *image_source;

@end
