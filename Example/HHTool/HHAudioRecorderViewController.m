//
//  HHAudioRecorderViewController.m
//  HHTool_Example
//
//  Created by Henry on 2021/6/23.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import "HHAudioRecorderViewController.h"
#import <HHTool/HHTool.h>

@interface HHAudioRecorderViewController ()

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation HHAudioRecorderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"录制" style:UIBarButtonItemStylePlain target:self action:@selector(onClickRecorder)];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(changeMaskView:) name:kHHAudioRecorderNotification object:nil];
    
    self.dataArray = [NSMutableArray array];
    self.count = 0;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
}

- (void)changeMaskView:(NSNotification *)noti {
    NSInteger vol = [noti.userInfo[@"voiceLevel"] integerValue];
    NSLog(@"voiceLevel: %ld", vol);
    
    self.count ++;
    
    if (self.count == 4) {
        self.count = 0;
        NSDictionary *dic = [[HHAudioRecorder shared] stopRecord];
        NSLog(@"%@", dic);
        
        [self.dataArray addObject:dic[@"path"]];
        
        [self.tableView reloadData];
    }
}

- (void)onClickRecorder {
    [[HHAudioRecorder shared] startRecord];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [[HHAudioPlayer shared] playWithURL:self.dataArray[indexPath.row]];
}

@end
