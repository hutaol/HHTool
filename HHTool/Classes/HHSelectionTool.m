//
//  HHSelectionTool.m
//  Pods
//
//  Created by Henry on 2021/9/29.
//

#import "HHSelectionTool.h"

@implementation HHSelectionTool

+ (void)shadowSelectionWithCell:(UICollectionViewCell *)cell selectedIndex:(NSInteger)index indexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == index) {
        cell.layer.shadowColor = [UIColor grayColor].CGColor;
        cell.layer.shadowOffset = CGSizeMake(0, 1.0f);
        cell.layer.shadowRadius = 8.0f;
        cell.layer.shadowOpacity = 1.0f;
        cell.layer.masksToBounds = NO;
    } else {
        cell.layer.shadowColor = [UIColor clearColor].CGColor;
        cell.layer.masksToBounds = YES;
    }
}

+ (void)shadowSelectionWithCell:(UICollectionViewCell *)cell selectedIndexPath:(NSIndexPath *)selectedIndexPath indexPath:(NSIndexPath *)indexPath {

    if (indexPath == selectedIndexPath) {
        cell.layer.shadowColor = [UIColor grayColor].CGColor;
        cell.layer.shadowOffset = CGSizeMake(0, 1.0f);
        cell.layer.shadowRadius = 8.0f;
        cell.layer.shadowOpacity = 1.0f;
        cell.layer.masksToBounds = NO;
    } else {
        cell.layer.shadowColor = [UIColor clearColor].CGColor;
        cell.layer.masksToBounds = YES;
    }
}

@end
