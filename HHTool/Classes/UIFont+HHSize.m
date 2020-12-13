//
//  UIFont+HHSize.m
//  Pods
//
//  Created by Henry on 2020/12/13.
//

#import "UIFont+HHSize.h"

#define FONT_COEFFICIENT @"HH_FONT_COEFFICIENT"

@implementation UIFont (HHSize)

+ (void)setFontSizeCoefficient:(NSInteger)coefficient {
    [[NSUserDefaults standardUserDefaults] setInteger:coefficient forKey:FONT_COEFFICIENT];
}

+ (NSInteger)getFontSizeCoefficient {
    
    NSInteger coefficient = [[NSUserDefaults standardUserDefaults] integerForKey:FONT_COEFFICIENT];
    if (coefficient == 0) {//返回默认2
        return 2;
    }
    return  coefficient;
}

+ (float)getScaleCoefficient {
    
    NSInteger coefficient = [self getFontSizeCoefficient];
    return 0.075*(coefficient-2)+1;
}

+ (UIFont *)fontOfSize:(CGFloat)fontSize {
    NSInteger coefficient = [self getFontSizeCoefficient];

    float x = 0.075*(coefficient-2)+1; //改变系数x 为0.925 --1.30
    return [UIFont systemFontOfSize:fontSize*x];

}

+ (UIFont *)fontOfSize:(CGFloat)fontSize coefficient:(NSInteger)coefficient {
    float x = 0.075*(coefficient-2)+1; //改变系数x 为0.925 --1.30
    return [UIFont systemFontOfSize:fontSize*x];
}


@end
