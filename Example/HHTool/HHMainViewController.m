//
//  HHMainViewController.m
//  HHTool_Example
//
//  Created by Henry on 2021/1/5.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import "HHMainViewController.h"
#import "HHCountryTableViewController.h"
#import "HHEmptyDataSetTableViewController.h"
#import "HHPhotoViewController.h"
#import "HHAlertTableViewController.h"
#import "HHPopupTableViewController.h"
#import "HHAudioRecorderViewController.h"
#import "HHButtonViewController.h"
#import "HHProgressHUDViewController.h"

@interface HHMainViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation HHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"例子";
    
    self.dataArray = @[
        @"国家列表",
        @"EmptyDataSet",
        @"Photo",
        @"Alert",
        @"Popup",
        @"录制音频",
        @"按钮",
        @"加载提示框"].mutableCopy;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            HHCountryTableViewController *vc = [[HHCountryTableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            HHEmptyDataSetTableViewController *vc = [[HHEmptyDataSetTableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            HHPhotoViewController *vc = [[HHPhotoViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            HHAlertTableViewController *vc = [[HHAlertTableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 4:
        {
            HHPopupTableViewController *vc = [[HHPopupTableViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            HHAudioRecorderViewController *vc = [[HHAudioRecorderViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 6:
        {
            HHButtonViewController *vc = [[HHButtonViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            HHProgressHUDViewController *vc = [[HHProgressHUDViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}

@end
