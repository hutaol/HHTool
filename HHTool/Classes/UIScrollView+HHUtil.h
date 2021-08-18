//
//  UIScrollView+HHUtil.h
//  HHTool
//
//  Created by Henry on 2021/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (HHUtil)

#pragma mark - ContentOffset

@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, assign) CGFloat offsetY;

- (void)setOffsetX:(CGFloat)offsetX animated:(BOOL)animated;
- (void)setOffsetY:(CGFloat)offsetY animated:(BOOL)animated;


#pragma mark - ContentSize

@property (nonatomic, assign) CGFloat contentWidth;
@property (nonatomic, assign) CGFloat contentHeight;


#pragma mark - Scroll

/// 滚动到最顶端
- (void)scrollToTopWithAnimation:(BOOL)animation;

/// 滚动到最底端
- (void)scrollToBottomWithAnimation:(BOOL)animation;

/// 滚动到最左端
- (void)scrollToLeftWithAnimation:(BOOL)animation;

/// 滚动到最右端
- (void)scrollToRightWithAnimation:(BOOL)animation;

@end

NS_ASSUME_NONNULL_END
