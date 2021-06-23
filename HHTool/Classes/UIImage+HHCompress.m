//
//  UIImage+HHCompress.m
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import "UIImage+HHCompress.h"

@implementation UIImage (HHCompress)

+ (UIImage *)hh_resizeImage:(UIImage *)image scaleToSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end
