//
//  NSString+HHUtil.h
//  Pods
//
//  Created by Henry on 2021/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HHUtil)

+ (BOOL)hh_isEmpty:(NSString *)str;
+ (BOOL)hh_isNotEmpty:(NSString *)str;

- (NSString *)hh_trim;

@end

NS_ASSUME_NONNULL_END
