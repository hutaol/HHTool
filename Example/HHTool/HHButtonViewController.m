//
//  HHButtonViewController.m
//  HHTool_Example
//
//  Created by Henry on 2021/6/24.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import "HHButtonViewController.h"
#import <HHTool/HHTool.h>

@interface HHButtonViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation HHButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.bounds = CGRectMake(0, 0, 100, 50);
    self.button.center = self.view.center;
    
    [self.view addSubview:self.button];
    
    [self.button setTitle:@"按钮" forState:UIControlStateNormal];
    [self.button setImage:[UIImage imageNamed:@"ic_pop_scan_green"] forState:UIControlStateNormal];
    
    self.button.hh_imgTitleDistance = 10;
    self.button.hh_titleWithImageAlignment = HHTitleWithImageAlignmentDown;
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
