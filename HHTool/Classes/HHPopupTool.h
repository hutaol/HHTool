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

+ (YBPopupMenu *)showInView:(UIView *)view titles:(NSArray *)titles action:(nullable HHPopupToolDidSelected)action;

+ (YBPopupMenu *)showInView:(UIView *)view titles:(NSArray *)titles icons:(nullable NSArray *)icons action:(nullable HHPopupToolDidSelected)action;

/// 依赖指定view弹出
/// @param view  指定view
/// @param titles 标题数组  数组里是NSString/NSAttributedString
/// @param icons  图标数组  数组里是UIImage
/// @param menuWidth 菜单宽度
/// @param action 点击Item回调
+ (YBPopupMenu *)showInView:(UIView *)view titles:(NSArray *)titles icons:(nullable NSArray *)icons menuWidth:(CGFloat)menuWidth action:(nullable HHPopupToolDidSelected)action;

+ (YBPopupMenu *)showInPoint:(CGPoint)point titles:(NSArray *)titles icons:(nullable NSArray *)icons menuWidth:(CGFloat)menuWidth action:(nullable HHPopupToolDidSelected)action;

@end

NS_ASSUME_NONNULL_END
