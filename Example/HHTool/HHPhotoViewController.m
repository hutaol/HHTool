//
//  HHPhotoViewController.m
//  HHTool_Example
//
//  Created by Henry on 2021/1/17.
//  Copyright © 2021 1325049637@qq.com. All rights reserved.
//

#import "HHPhotoViewController.h"
#import <HHTool/HHTool.h>
#import <SDWebImage/UIImage+GIF.h>

@interface HHPhotoViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, copy) NSString *imagePath;

@end

@implementation HHPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(onClick)];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.width, 300)];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.backgroundColor = [UIColor grayColor];
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickImage)];
    [self.imageView addGestureRecognizer:tap];
    
    [HHConfiguration languageType:HHLanguageChineseSimplified];
}

- (void)onClick {
    [HHPhotoTool imagePickerSingleWithController:self seletedVideo:YES edit:YES completion:^(HHPhotoModel * _Nonnull model) {
        if (model.type == HHPhotoModelMediaTypePhotoGif) {
            // 保存路径
            NSInteger timeStamp = [[NSDate new] timeIntervalSince1970];
            NSString *tmpPath = NSTemporaryDirectory();
            NSString *imagePath = [NSString stringWithFormat:@"%@/%ld.gif", tmpPath, timeStamp];
            [model.data writeToFile:imagePath atomically:YES];
            
            self.imagePath = imagePath;
            
            UIImage *gifImage = [UIImage sd_imageWithGIFData:model.data];
            self.imageView.image = gifImage;
            
        } else if (model.type == HHPhotoModelMediaTypePhoto) {
            self.imageView.image = model.image;
        } else if (model.type == HHPhotoModelMediaTypeVideo) {
//            self.imageView.image = model.image;
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [HHPhotoTool showVideoWithController:self videoURL:model.videoURL coverURL:nil videoDuration:0 preview:nil];

            });
        }
        
    }];
}

- (void)onClickImage {
    if (!self.imageView.image) {
        return;
    }
    
    [HHPhotoTool showImageWithController:self source:@[self.imagePath?:self.imageView.image] previews:@[self.imageView] index:0];
}


@end
