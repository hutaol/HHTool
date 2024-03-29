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
#import "HHCornerRadiusViewController.h"

@interface HHMainViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation HHMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"例子";
    
    self.dataArray = @[
        @{@"title":@"国家列表", @"vc":@"HHCountryTableViewController"},
        @{@"title":@"EmptyDataSet", @"vc":@"HHEmptyDataSetTableViewController"},
        @{@"title":@"Photo", @"vc":@"HHPhotoViewController"},
        @{@"title":@"Alert", @"vc":@"HHAlertTableViewController"},
        @{@"title":@"Popup", @"vc":@"HHPopupTableViewController"},
        @{@"title":@"录制音频", @"vc":@"HHAudioRecorderViewController"},
        @{@"title":@"按钮", @"vc":@"HHButtonViewController"},
        @{@"title":@"加载提示框", @"vc":@"HHProgressHUDViewController"},
        @{@"title":@"图片圆角", @"vc":@"HHCornerRadiusViewController"},
    ];
    
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
    
    cell.textLabel.text = self.dataArray[indexPath.row][@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *str = self.dataArray[indexPath.row][@"vc"];
    NSString *title = self.dataArray[indexPath.row][@"title"];
    UIViewController *vc = [[NSClassFromString(str) alloc] init];
    vc.title = title;
    [self.navigationController pushViewController:vc animated:YES];

}

@end
