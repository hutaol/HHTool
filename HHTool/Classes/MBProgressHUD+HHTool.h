//
//  MBProgressHUD+HHTool.h
//  HHTool
//
//  Created by Henry on 2020/11/3.
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (HHTool)

+ (void)show;
+ (void)show:(NSString *)message;
+ (void)show:(NSString *)message view:(nullable UIView *)view;

+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success view:(nullable UIView *)view;
+ (void)showSuccess:(NSString *)success duration:(NSUInteger)time;
+ (void)showSuccess:(NSString *)success duration:(NSUInteger)time view:(nullable UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error view:(nullable UIView *)view;
+ (void)showError:(NSString *)error duration:(NSUInteger)time;
+ (void)showError:(NSString *)error duration:(NSUInteger)time view:(nullable UIView *)view;

+ (void)hide;
+ (void)hide:(nullable UIView *)view;


@end

NS_ASSUME_NONNULL_END
