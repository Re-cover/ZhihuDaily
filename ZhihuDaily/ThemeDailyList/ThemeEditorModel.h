//
//  ThemeEditorModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

//                {
//                    "url": "http://www.zhihu.com/people/3asic",
//                    "bio": "录音师，电子音乐制作人",
//                    "id": 51,
//                    "avatar": "http://pic1.zhimg.com/7c0252b19accff6cf0de8ec789508b68_m.jpg",
//                    "name": "贝塞克"
//                }

@interface ThemeEditorModel : NSObject <YYModel>

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *bio;

@property (nonatomic, assign) NSInteger editorId;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *name;

@end
