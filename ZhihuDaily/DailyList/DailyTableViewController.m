//
//  DailyTableViewController.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/1.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "DailyTableViewController.h"
#import "ApiRequest.h"

#import "StoryModel.h"
#import "TopStoryModel.h"
#import "LatestStoriesModel.h"
#import "BeforeStoriesModel.h"

#import "ImageStoryCell.h"
#import "ImageScrollView.h"
#import <YYWebImage.h>
#import <Masonry.h>

#import <SVPullToRefresh.h>


#define weakify(object) autoreleasepool{} __weak typeof(object) weak_##object = object;
@interface DailyTableViewController()

@property (nonatomic, strong) NSMutableArray *modelArrary;

@property (nonatomic, strong) ImageScrollView *imageScrollView;

@end

@implementation DailyTableViewController


# pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
    [self.tableView setShowsVerticalScrollIndicator:NO];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 15, 0, 15)];
    [self.tableView setSeparatorColor:[UIColor lightGrayColor]];
    @weakify(self);
    
    self.imageScrollView = [[ImageScrollView alloc] init];
    [self.tableView setTableHeaderView:self.imageScrollView];
    
    [self.tableView addPullToRefreshWithActionHandler:^{
        [weak_self loadLatestStories];
    }];
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        [weak_self loadBeforeStories];
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView triggerPullToRefresh];
}


-(void)loadLatestStories {
  @weakify(self);
    [ApiRequest latestStoriesModelComplete:^(LatestStoriesModel *model) {
        self.imageScrollView.topStoryModels = [model.topStories mutableCopy];
        if (!weak_self.modelArrary) {
            weak_self.modelArrary = [[NSMutableArray alloc] init];
            [weak_self.modelArrary addObject:model];
        } else {
//            [weak_self.modelArrary removeObjectAtIndex:0];
//            [weak_self.modelArrary insertObject:model atIndex:0];
            NSUInteger oldModelCount = [[[weak_self.modelArrary firstObject] stories] count];
            NSUInteger newModelCount = model.stories.count - oldModelCount;
            for (NSUInteger i = 0; i < oldModelCount; i++) {
                model.stories[i + newModelCount].isRead = [[[[weak_self.modelArrary firstObject] stories] objectAtIndex:i] isRead];
            }
            weak_self.modelArrary[0] = model;
        }
        [weak_self.tableView reloadData];
        [weak_self.tableView.pullToRefreshView stopAnimating];
    } failure:^(NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void)loadBeforeStories {
    @weakify(self);
    NSString *dateString = (NSString *)[[weak_self.modelArrary lastObject] date];
    NSLog(@"%@", dateString);
    [ApiRequest beforeStoriesModelWithParameter:dateString complete:^(BeforeStoriesModel *model) {
        [weak_self.modelArrary addObject:model];
        [weak_self.tableView reloadData];
        [weak_self.tableView.infiniteScrollingView stopAnimating];
    } failure:^(NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}


# pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.modelArrary.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.modelArrary[section] stories] count];
}

# pragma mark - storyModelWithIndexPath

- (StoryModel *)storyModelWithIndexPath:(NSIndexPath *)indexPath {
    StoryModel *model = [[StoryModel alloc] init];
    model = [[self.modelArrary[indexPath.section] stories] objectAtIndex:indexPath.row];
    return model;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"imageStoryCell";
    ImageStoryCell *imageStoryCell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!imageStoryCell) {
        imageStoryCell = [[ImageStoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [imageStoryCell.storyTitleLabel setText: [self storyModelWithIndexPath:indexPath].title];
    [imageStoryCell.storyImageView yy_setImageWithURL:[NSURL URLWithString:[[self storyModelWithIndexPath:indexPath].images firstObject]] placeholder:nil];
    //注意这里由于要对cell进行重用，所以对于非多图的cell要进行hidden
    if ([[self storyModelWithIndexPath:indexPath] multipic]) {
        [imageStoryCell.multiPicImageView setHidden:NO];
    } else {
        [imageStoryCell.multiPicImageView setHidden:YES];
    }
    //同上
    if ([[self storyModelWithIndexPath:indexPath] isRead]) {
        [imageStoryCell.storyTitleLabel setTextColor:[UIColor grayColor]];
    } else {
        [imageStoryCell.storyTitleLabel setTextColor:[UIColor blackColor]];
    }
    return imageStoryCell;
}
# pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ? 30 : 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [[self storyModelWithIndexPath:indexPath] setIsRead:YES];
    //[self.tableView reloadData];
    //NSLog(@"%ld", indexPath.row);
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat yOffset = self.tableView.contentOffset.y;
//    CGFloat height = self.tableView.tableHeaderView.frame.size.height;
//    if (yOffset < 0) {
//        height = 200 - yOffset;
//        [self.tableView beginUpdates];
//        [self.tableView.tableHeaderView setFrame:CGRectMake(0, yOffset / 2, self.view.bounds.size.width, height)];
//        [self.imageScrollView.imageScrollView setContentSize:CGSizeMake(self.imageScrollView.imageScrollView.bounds.size.width, height)];
//        [self.tableView setTableHeaderView:self.imageScrollView];
//        [self.tableView endUpdates];
//    }
    CGFloat sectionHeaderHeight = 30;
    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}
@end
