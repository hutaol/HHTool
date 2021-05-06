//
//  HHPopupTool.m
//  Pods
//
//  Created by Henry on 2020/12/13.
//

#import "HHPopupTool.h"
#import "NSString+HHSize.h"
#import "HHPopupListView.h"
#import "UIWindow+HHHelper.h"


@interface HHPopupTool () <YBPopupMenuDelegate>

@property (nonatomic, copy) HHPopupToolDidSelected black;

@end

@implementation HHPopupTool

static HHPopupTool *_sharedInstance = nil;
static dispatch_once_t onceToken = 0;

+ (instancetype)sharedInstance {
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

+ (void)attempDealloc {
    onceToken = 0;
    _sharedInstance = nil;
}

+ (UIViewController *)topViewController {
    return [UIWindow topViewController];
}

+ (YBPopupMenu *)showInView:(UIView *)view titles:(NSArray *)titles action:(HHPopupToolDidSelected)action {
    CGFloat maxWidth = [self size:nil titles:titles];
    return [[HHPopupTool sharedInstance] show:view point:CGPointZero titles:titles icons:nil menuWidth:maxWidth action:action];
}

+ (YBPopupMenu *)showInView:(UIView *)view titles:(NSArray *)titles icons:(NSArray *)icons action:(HHPopupToolDidSelected)action {
    CGFloat maxWidth = [self size:icons titles:titles];
    return [[HHPopupTool sharedInstance] show:view point:CGPointZero titles:titles icons:icons menuWidth:maxWidth action:action];
}

+ (YBPopupMenu *)showInView:(UIView *)view titles:(NSArray *)titles icons:(NSArray *)icons menuWidth:(CGFloat)menuWidth action:(HHPopupToolDidSelected)action {
    return[[HHPopupTool sharedInstance] show:view point:CGPointZero titles:titles icons:icons menuWidth:menuWidth action:action];
}

+ (YBPopupMenu *)showInPoint:(CGPoint)point titles:(NSArray *)titles icons:(NSArray *)icons menuWidth:(CGFloat)menuWidth action:(HHPopupToolDidSelected)action {
    return [[HHPopupTool sharedInstance] show:nil point:point titles:titles icons:icons menuWidth:menuWidth action:action];
}

- (YBPopupMenu *)show:(UIView *)view point:(CGPoint)point titles:(NSArray *)titles icons:(NSArray *)icons menuWidth:(CGFloat)menuWidth action:(HHPopupToolDidSelected)action {
    self.black = action;
    
    if (view) {
        return [YBPopupMenu showRelyOnView:view titles:titles icons:icons menuWidth:menuWidth otherSettings:^(YBPopupMenu *popupMenu) {
            popupMenu.delegate = self;
        }];
    } else {
        return [YBPopupMenu showAtPoint:point titles:titles icons:icons menuWidth:menuWidth otherSettings:^(YBPopupMenu *popupMenu) {
            popupMenu.delegate = self;
        }];
    }
    
}

- (void)ybPopupMenu:(YBPopupMenu *)ybPopupMenu didSelectedAtIndex:(NSInteger)index {
    if (self.black) {
        self.black(index, ybPopupMenu);
    }
    [HHPopupTool attempDealloc];
}

// TODO 默认字体15，有图片宽度36 最大60
+ (CGFloat)size:(NSArray *)icons titles:(NSArray *)titles {
    CGFloat maxWidth = 0;
    for (int i = 0; i < titles.count; i ++) {
        NSString *title = titles[i];
        CGSize size = [title hh_textSizeInFont:[UIFont systemFontOfSize:15]];
        
        // img
        CGFloat widthImg = 0;
        if (icons.count > i) {
            UIImage *img = icons[i];
            if ([img isKindOfClass:[UIImage class]]) {
                widthImg = MIN(img.size.width*2, 60);
            } else {
                widthImg = 36;
            }
        }
        maxWidth = MAX(maxWidth, size.width+widthImg);
    }
    
    maxWidth += 32;
    return maxWidth;
}

+ (SPAlertController *)showPopupView:(UIView *)view {
   return [self showPopupView:view postion:HHPopupPositionCenter];
}

+ (SPAlertController *)showPopupView:(UIView *)view postion:(HHPopupPosition)postion {
    
    SPAlertControllerStyle preferredStyle = SPAlertControllerStyleAlert;
    if (postion == HHPopupPositionBottom) {
        preferredStyle = SPAlertControllerStyleActionSheet;
    }
    
    SPAlertController *alertController = [SPAlertController alertControllerWithCustomAlertView:view preferredStyle:preferredStyle animationType:SPAlertAnimationTypeDefault];
   [[self topViewController] presentViewController:alertController animated:YES completion:nil];
    return alertController;
}

+ (SPAlertController *)showPopupListTitle:(NSString *)title dataArray:(NSArray *)dataArray postion:(HHPopupPosition)postion action:(nullable HHPopupToolListDidSelected)action {
    
    HHPopupListView *view = [[HHPopupListView alloc] initWithTitle:title dataArray:dataArray];
    
    SPAlertController *alertController = [self showPopupView:view postion:postion];
    
    view.didRowBlock = ^(NSInteger index, NSString * _Nonnull text) {
        [alertController dismissViewControllerAnimated:YES completion:^{
            if (action) {
                action(index, text);
            }
        }];
        
    };
    return alertController;
}

+ (SPAlertController *)showPopupBottomListTitle:(NSString *)title dataArray:(NSArray *)dataArray action:(nullable HHPopupToolListDidSelected)action {
    return [self showPopupListTitle:title dataArray:dataArray postion:HHPopupPositionBottom action:action];
}

+ (SPAlertController *)showPopupCenterListTitle:(NSString *)title dataArray:(NSArray *)dataArray action:(nullable HHPopupToolListDidSelected)action {
    return [self showPopupListTitle:title dataArray:dataArray postion:HHPopupPositionCenter action:action];
}

@end
