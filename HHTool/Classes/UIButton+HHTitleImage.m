//
//  UIButton+HHTitleImage.m
//  Pods
//
//  Created by Henry on 2021/6/24.
//

#import "UIButton+HHTitleImage.h"
#import <objc/runtime.h>

@implementation UIButton (HHTitleImage)

- (HHTitleWithImageAlignment)hh_titleWithImageAlignment {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setHh_titleWithImageAlignment:(HHTitleWithImageAlignment)hh_titleWithImageAlignment {
    objc_setAssociatedObject(self, @selector(hh_titleWithImageAlignment), @(hh_titleWithImageAlignment), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    [self.class swizzleLayoutSubviews];
}

- (CGFloat)hh_imgTitleDistance {
    return [objc_getAssociatedObject(self, _cmd) floatValue];
}

- (void)setHh_imgTitleDistance:(CGFloat)hh_imgTitleDistance {
    objc_setAssociatedObject(self, @selector(hh_imgTitleDistance), @(hh_imgTitleDistance), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)hh_LayoutSubviews {
    [self hh_LayoutSubviews];
    [self setupButtonLayout];
}

- (void)setupButtonLayout {
    if (self.hh_titleWithImageAlignment) {
        return;
    }
    CGFloat image_w = self.imageView.bounds.size.width;
    CGFloat image_h = self.imageView.bounds.size.height;
    
    CGFloat title_w = self.titleLabel.bounds.size.width;
    CGFloat title_h = self.titleLabel.bounds.size.height;
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        title_w = self.titleLabel.intrinsicContentSize.width;
        title_h = self.titleLabel.intrinsicContentSize.height;
    }
    
    UIEdgeInsets imageEdge = UIEdgeInsetsZero;
    UIEdgeInsets titleEdge = UIEdgeInsetsZero;
    
    if (self.hh_imgTitleDistance == 0) {
        self.hh_imgTitleDistance = 5;
    }
    switch (self.hh_titleWithImageAlignment) {
        case HHTitleWithImageAlignmentRight:
        {
            titleEdge = UIEdgeInsetsMake(0, self.hh_imgTitleDistance, 0, 0);
            imageEdge = UIEdgeInsetsMake(0, 0, 0, self.hh_imgTitleDistance);
        }
            break;
        case HHTitleWithImageAlignmentLeft:
        {
            titleEdge = UIEdgeInsetsMake(0, -image_w - self.hh_imgTitleDistance, 0, image_w);
            imageEdge = UIEdgeInsetsMake(0, title_w + self.hh_imgTitleDistance, 0, -title_w);
        }
            break;
        case HHTitleWithImageAlignmentDown:
        {
            titleEdge = UIEdgeInsetsMake(0, -image_w, -image_h - self.hh_imgTitleDistance, 0);
            imageEdge = UIEdgeInsetsMake(-title_h - self.hh_imgTitleDistance, 0, 0, -title_w);
        }
            break;
        case HHTitleWithImageAlignmentUp:
        {
            titleEdge = UIEdgeInsetsMake(-image_h - self.hh_imgTitleDistance, -image_w, 0, 0);
            imageEdge = UIEdgeInsetsMake(0, 0, -title_h - self.hh_imgTitleDistance, -title_w);
        }
            break;
            
        default:
            break;
    }
    
    self.imageEdgeInsets = imageEdge;
    self.titleEdgeInsets = titleEdge;
}

+ (void)swizzleLayoutSubviews {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(layoutSubviews) anotherMethod:@selector(hh_LayoutSubviews)];
    });
}

+ (void)swizzleMethod:(SEL)oneSel anotherMethod:(SEL)anotherSel {
    Method oneMethod = class_getInstanceMethod(self, oneSel);
    Method anotherMethod = class_getInstanceMethod(self, anotherSel);
    method_exchangeImplementations(oneMethod, anotherMethod);
}

@end
