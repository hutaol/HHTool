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

+ (UIImage*)hh_resizableHalfImage:(NSString *)name {
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat imageW = normal.size.width * 0.5;
    CGFloat imageH = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW)];
}

+ (NSData *)hh_compressImage:(UIImage *)image toMaxLength:(NSInteger)maxLength maxWidth:(NSInteger)maxWidth {
    NSAssert(maxLength > 0, @"图片的大小必须大于 0");
    NSAssert(maxWidth > 0, @"图片的最大边长必须大于 0");
    
    CGSize newSize = [self hh_scaleImage:image withLength:maxWidth];
    UIImage *newImage = [self hh_resizeImage:image withNewSize:newSize];
    
    CGFloat compress = 0.9f;
    NSData *data = UIImageJPEGRepresentation(newImage, compress);
    
    while (data.length > maxLength && compress > 0.01) {
        compress -= 0.02f;
        
        data = UIImageJPEGRepresentation(newImage, compress);
    }
    return data;
}

+ (UIImage *)hh_resizeImage:(UIImage *)image withNewSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (CGSize)hh_scaleImage:(UIImage *)image withLength:(CGFloat)imageLength {
    
    CGFloat newWidth = 0.0f;
    CGFloat newHeight = 0.0f;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    if (width > imageLength || height > imageLength) {
        
        if (width > height) {
            
            newWidth = imageLength;
            newHeight = newWidth * height / width;
            
        } else if(height > width) {
            
            newHeight = imageLength;
            newWidth = newHeight * width / height;
            
        } else {
            
            newWidth = imageLength;
            newHeight = imageLength;
        }
        
    } else {
        return CGSizeMake(width, height);
    }
    
    return CGSizeMake(newWidth, newHeight);
}

@end
