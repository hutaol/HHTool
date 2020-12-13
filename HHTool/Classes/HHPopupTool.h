//
//  HHPopupTool.h
//  Pods
//
//  Created by Henry on 2020/12/13.
//

#import <Foundation/Foundation.h>
#import <YBPopupMenu/YBPopupMenu.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^HHPopupToolDidSelected)(NSInteger index, YBPopupMenu *popupMenu);

/**
 简单使用，具体查看YBPopupMenu
 */
@interface HHPopupTool : NSObject

+ (void)showInView:(UIView *)view titles:(NSArray *)titles icons:(nullable NSArray *)icons menuWidth:(CGFloat)menuWidth action:(nullable HHPopupToolDidSelected)action;

+ (void)showInPoint:(CGPoint)Point titles:(NSArray *)titles icons:(nullable nullable NSArray *)icons menuWidth:(CGFloat)menuWidth action:(nullable HHPopupToolDidSelected)action;

@end

NS_ASSUME_NONNULL_END
