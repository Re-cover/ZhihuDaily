//
//  ThemeDailyTableViewController.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "ThemeDailyTableViewController.h"
#import "ThemeStoryModel.h"
#import "ThemeEditorModel.h"
#import "ThemeStoriesModel.h"
#import "ApiRequest.h"

#import "EditorCell.h"
#import "ImageCell.h"
#import "NoImageCell.h"
#import "StoryDetailViewController.h"

#import <YYWebImage.h>
#import <SVPullToRefresh.h>
#import <SWRevealViewController.h>

@interface ThemeDailyTableViewController ()

@property (nonatomic, strong) ThemeStoriesModel *model;

@end

@implementation ThemeDailyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigator];
}

- (void) viewWillAppear:(BOOL)animated {
    [self loadThemeStories];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section ? self.model.stories.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        EditorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"editorCell"];
        return cell;
    } else {
        if (self.model.stories[indexPath.row].images != nil) {
            ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
            [cell.titleLabel setText:[self themeStoryModelWithIndexPath:indexPath].title];
            NSURL *url = [NSURL URLWithString:[[self themeStoryModelWithIndexPath:indexPath].images firstObject]];
            [cell.themeImage yy_setImageWithURL:url placeholder:nil];
            return cell;
        } else {
            NoImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noImageCell"];
            [cell.titleLabel setText:[self themeStoryModelWithIndexPath:indexPath].title];
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section == 0 ? 40 : 90;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        NSString *themeStoryId = [NSString stringWithFormat:@"%ld", [self themeStoryModelWithIndexPath:indexPath].themeStoryId];
        [self performSegueWithIdentifier:@"toThemeStoryDetailSegue" sender:themeStoryId];
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    StoryDetailViewController *vc = segue.destinationViewController;
    vc.storyId = sender;
}

#pragma mark - Private Methods
- (void)loadThemeStories {
    @weakify(self);
    [ApiRequest themeStoriesModelWithParameter:self.themeId
                                      complete:^(ThemeStoriesModel *model) {
                                          weak_self.model = model;
                                          [weak_self.navigationController setTitle:model.name];
                                          [weak_self.tableView reloadData];
                                      } failure:^(NSError *error) {
                                          NSLog(@"%@", error.localizedDescription);
                                      }];
}

- (ThemeStoryModel *)themeStoryModelWithIndexPath:(NSIndexPath *)indexPath {
    return self.model.stories[indexPath.row];
}

- (void)initNavigator {
    SWRevealViewController *revealVC = self.revealViewController;
    [self.view addGestureRecognizer:revealVC.tapGestureRecognizer];
    [self.view addGestureRecognizer:revealVC.panGestureRecognizer];
    //[self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:23/255. green:144/255. blue:211/255. alpha:1]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Dark_News_Arrow"] style:UIBarButtonItemStylePlain target:revealVC action:@selector(revealToggle:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Dark_Management_Add"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
}

@end
