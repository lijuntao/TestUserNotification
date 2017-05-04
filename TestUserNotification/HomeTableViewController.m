//
//  HomeTableViewController.m
//  TestUserNotification
//
//  Created by 李俊涛 on 2017/5/3.
//  Copyright © 2017年 李俊涛. All rights reserved.
//

#import "HomeTableViewController.h"
#import "AuthorizationViewController.h"
#import "TimeIntervalViewController.h"
#import "TimeIntervalForegroundViewController.h"
#import "ManagementViewController.h"
#import "CategoryViewController.h"
#import "MediaViewController.h"
#import "CustomizeViewController.h"
@interface HomeTableViewController ()

@property (nonatomic, strong) NSArray *arrayData;

@end

@implementation HomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.arrayData = @[@"权限申请",@"后台通知",@"前台通知",@"管理通知",@"交互通知",@"多媒体通知",@"自定义UI通知"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"home"];
    }
    cell.textLabel.text = self.arrayData[indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击%@",self.arrayData[indexPath.row]);
    if (indexPath.row == 0) {
        AuthorizationViewController *pushVC = [[AuthorizationViewController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else if (indexPath.row == 1) {
        TimeIntervalViewController *pushVC = [[TimeIntervalViewController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else if (indexPath.row == 2) {
        TimeIntervalForegroundViewController *pushVC = [[TimeIntervalForegroundViewController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else if (indexPath.row == 3) {
        ManagementViewController *pushVC = [[ManagementViewController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else if (indexPath.row == 4) {
        CategoryViewController *pushVC = [[CategoryViewController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else if (indexPath.row == 5) {
        MediaViewController *pushVC = [[MediaViewController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else if (indexPath.row == 6) {
        CustomizeViewController *pushVC = [[CustomizeViewController alloc] init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else {
        //do nothing
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
