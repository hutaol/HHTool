//
//  UIImageView+HHCornerRadius.h
//  HHTool
//
//  Created by Henry on 2021/6/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (HHCornerRadius)

- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius rectCorner:(UIRectCorner)rectCorner;

- (instancetype)initWithCornerRadius:(CGFloat)cornerRadius;

- (instancetype)initWithRoundRect;

- (void)hh_cornerRadius:(CGFloat)cornerRadius rectCorner:(UIRectCorner)rectCorner;

- (void)hh_cornerRadius:(CGFloat)cornerRadius;

- (void)hh_cornerRadiusRoundRect;
 
- (void)hh_borderWidth:(CGFloat)width color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
