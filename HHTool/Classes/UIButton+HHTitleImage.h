//
//  UIButton+HHTitleImage.h
//  Pods
//
//  Created by Henry on 2021/6/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HHTitleWithImageAlignment) {
    HHTitleWithImageAlignmentUp = 1,  // title is up
    HHTitleWithImageAlignmentLeft,    // title is left
    HHTitleWithImageAlignmentDown,    // title is down
    HHTitleWithImageAlignmentRight    // title is right
};

@interface UIButton (HHTitleImage)

@property (nonatomic) IBInspectable CGFloat hh_imgTitleDistance;  // distance between image and title, default is 5

@property (nonatomic, assign) HHTitleWithImageAlignment hh_titleWithImageAlignment;

@end

NS_ASSUME_NONNULL_END
