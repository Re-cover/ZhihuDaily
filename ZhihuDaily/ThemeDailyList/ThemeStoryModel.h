//
//  ThemeStoryModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

//                {
//                    "type": 0,
//                    "id": 7576079,
//                    "title": "孟奇：为什么科技的发展没有使电子乐器超越传统乐器的地位？"
//                },
//                {
//                    "images": [
//                               "http://pic3.zhimg.com/5e83b433111ce3e74a97b022c1d901a6.jpg"
//                               ],
//                    "type": 0,
//                    "id": 7566325,
//                    "title": "游戏公司中的「音频组」是干什么的？"
//                },


@interface ThemeStoryModel : NSObject <YYModel>

@property (nonatomic, strong) NSArray<NSString *> *images;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger themeStoryId;

@property (nonatomic, copy) NSString *title;

@end
