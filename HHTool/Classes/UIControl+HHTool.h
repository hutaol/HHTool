//
//  UIControl+HHTool.h
//  Pods
//
//  Created by Henry on 2021/9/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 避免UIButton在同一时间多次点击
@interface UIControl (HHTool)

/// 添加点击事件的间隔时间
@property (nonatomic, assign) NSTimeInterval hh_acceptEventInterval;

/// 忽略该点击事件间隔
@property (nonatomic, assign) BOOL hh_ignoreEvent;

@end

NS_ASSUME_NONNULL_END
