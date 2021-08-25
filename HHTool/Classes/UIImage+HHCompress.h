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

+ (UIImage*)hh_resizableHalfImage:(NSString *)name;

+ (NSData *)hh_compressImage:(UIImage *)image toMaxLength:(NSInteger)maxLength maxWidth:(NSInteger)maxWidth;

+ (UIImage *)hh_resizeImage:(UIImage *)image withNewSize:(CGSize)newSize;

+ (CGSize)hh_scaleImage:(UIImage *)image withLength:(CGFloat)imageLength;

@end

NS_ASSUME_NONNULL_END
