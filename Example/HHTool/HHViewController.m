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
    [HHPopupTool showInView:view titles:@[@"11"] icons:nil menuWidth:120 action:^(NSInteger index, YBPopupMenu * _Nonnull popupMenu) {
        NSLog(@"%ld", index);

    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
