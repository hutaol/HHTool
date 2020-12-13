//
//  UIFont+HHSize.h
//  Pods
//
//  Created by Henry on 2020/12/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 利用字体系数改变字体大小
 */
@interface UIFont (HHSize)

// 设置字体大小系数，1到6  2为默认标准
+ (void)setFontSizeCoefficient:(NSInteger)coefficient;

// 读取字体大小系数，1到6  2为默认标准
+ (NSInteger)getFontSizeCoefficient;

// 读取比例系数 (0.925~1.30)
+ (float)getScaleCoefficient;


+ (UIFont *)fontOfSize:(CGFloat)fontSize;

+ (UIFont *)fontOfSize:(CGFloat)fontSize coefficient:(NSInteger)coefficient;

@end

NS_ASSUME_NONNULL_END
