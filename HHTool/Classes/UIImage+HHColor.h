//
//  UIImage+HHColor.h
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HHColor)

+ (UIImage *)hh_imageWithColor:(UIColor *)color;

+ (UIImage *)hh_imageWithColor:(UIColor *)color size:(CGSize)size;

- (UIImage *)hh_imageWithColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
