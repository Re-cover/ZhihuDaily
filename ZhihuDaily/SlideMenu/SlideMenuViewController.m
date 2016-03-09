//
//  SlideMenuViewController.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/8.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "SlideMenuModel.h"
#import "SlideModelCellModel.h"
#import "ApiRequest.h"

#import "HomeCell.h"
#import "ThemeCell.h"

#import "ThemeDailyTableViewController.h"

@interface SlideMenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) SlideMenuModel *model;

@end

@implementation SlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    [ApiRequest slideMenuModelComplete:^(SlideMenuModel *model) {
        self.model = model;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.others.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * const homeCellId = @"homeCell";
    NSString * const themeCellId = @"themeCell";
    if (indexPath.row == 0) {
        HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:homeCellId];
        return cell;
    } else {
        ThemeCell *cell = [tableView dequeueReusableCellWithIdentifier:themeCellId];
        [cell.titleLabel setText:[self.model.others[indexPath.row] name]];
        return cell;
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self performSegueWithIdentifier:@"toDailyListSegue" sender:nil];
    } else {
        NSString *themeId = [NSString stringWithFormat:@"%ld", self.model.others[indexPath.row].themeId];
        NSString *name = self.model.others[indexPath.row].name;
        NSArray *senderArray = [NSArray arrayWithObjects:name, themeId, nil];
        [self performSegueWithIdentifier:@"toThemeDailyListSegue" sender:senderArray];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSArray *senderArray = (NSArray *)sender;
    if ([segue.identifier isEqual: @"toThemeDailyListSegue"]) {
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        if ([[nav topViewController]isKindOfClass:[ThemeDailyTableViewController class]]) {
            ThemeDailyTableViewController *vc = (ThemeDailyTableViewController *)[nav topViewController];
            vc.title = senderArray[0];
            vc.themeId = senderArray[1];
        }
    }
}

@end
