//
//  HHButtonViewController.m
//  HHTool_Example
//
//  Created by Henry on 2021/6/24.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import "HHButtonViewController.h"
#import <HHTool/HHTool.h>

@interface HHButtonViewCell : UICollectionViewCell

@property (nonatomic, strong) UIButton *button;

@end

@implementation HHButtonViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = self.bounds;
        
        [self.button setTitle:@"微信" forState:UIControlStateNormal];
        // UIButtonTypeSystem，添加图片时候，不显示图片只显示蓝色
        [self.button setImage:[UIImage imageNamed:@"wechat"] forState:UIControlStateNormal];
        // 改变图片的渲染方式，是原始的，就不会受系统的影响了
//        [self.button setImage:[[UIImage imageNamed:@"wechat"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.button];
    }
    return self;
}

@end

@interface HHButtonViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation HHButtonViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init
{
    self = [super init];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat width = ([UIScreen mainScreen].bounds.size.width-40)/3;
        layout.itemSize = CGSizeMake(width, width);
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumInteritemSpacing = 10;
        layout.minimumLineSpacing = 10;

        return [super initWithCollectionViewLayout:layout];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self.collectionView registerClass:[HHButtonViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.dataArray = @[
        @(HHTitleWithImageAlignmentUp),
        @(HHTitleWithImageAlignmentLeft),
        @(HHTitleWithImageAlignmentDown),
        @(HHTitleWithImageAlignmentRight),
    ];
}

#pragma mark - UICollectionView data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HHButtonViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    HHTitleWithImageAlignment value = [self.dataArray[indexPath.row] integerValue];
    
    cell.button.hh_imgTitleDistance = 10;
    cell.button.hh_titleWithImageAlignment = value;
    
    return cell;
}


@end
