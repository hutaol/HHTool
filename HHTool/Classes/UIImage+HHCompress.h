//
//  UIImage+HHCompress.h
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HHCompress)

+ (UIImage *)hh_resizeImage:(UIImage *)image scaleToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
