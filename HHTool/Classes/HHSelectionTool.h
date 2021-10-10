//
//  HHSelectionTool.h
//  Pods
//
//  Created by Henry on 2021/9/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHSelectionTool : NSObject

/// 阴影选择
/// 在方法 `cellForItemAtIndexPath` 设置
/// @param cell UICollectionViewCell
/// @param selectedIndexPath 选中的indexPath
/// @param indexPath indexPath
+ (void)shadowSelectionWithCell:(UICollectionViewCell *)cell selectedIndexPath:(NSIndexPath *)selectedIndexPath indexPath:(NSIndexPath *)indexPath;

/// 单个Section
+ (void)shadowSelectionWithCell:(UICollectionViewCell *)cell selectedIndex:(NSInteger)index indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
