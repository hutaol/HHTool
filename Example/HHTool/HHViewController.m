//
//  HHViewController.m
//  HHTool
//
//  Created by 1325049637@qq.com on 12/13/2020.
//  Copyright (c) 2020 1325049637@qq.com. All rights reserved.
//

#import "HHViewController.h"
#import <HHTool/HHTool.h>

@interface HHViewController ()

@end

@implementation HHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"dd" style:UIBarButtonItemStylePlain target:self action:@selector(ddd:)];

}

- (void)ddd:(UIBarButtonItem *)sender {
    UIView *view = [sender valueForKey:@"view"];
    NSArray *titles = @[@"创建群聊", @"少一事", @"搜索的地方"];
    NSArray *images = @[@"ic_pop_scan_green", @"ic_pop_scan_green"];
    
    [HHPopupTool showInView:view titles:titles icons:images action:^(NSInteger index, YBPopupMenu * _Nonnull popupMenu) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
