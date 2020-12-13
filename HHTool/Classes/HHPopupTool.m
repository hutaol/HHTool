//
//  HHPopupTool.m
//  Pods
//
//  Created by Henry on 2020/12/13.
//

#import "HHPopupTool.h"

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

+ (void)showInView:(UIView *)view titles:(NSArray *)titles icons:(NSArray *)icons menuWidth:(CGFloat)menuWidth action:(HHPopupToolDidSelected)action {
    [[HHPopupTool sharedInstance] show:view point:CGPointZero titles:titles icons:icons menuWidth:menuWidth action:action];
}

+ (void)showInPoint:(CGPoint)point titles:(NSArray *)titles icons:(nullable NSArray *)icons menuWidth:(CGFloat)menuWidth action:(nullable HHPopupToolDidSelected)action {
    [[HHPopupTool sharedInstance] show:nil point:point titles:titles icons:icons menuWidth:menuWidth action:action];
}

- (void)show:(UIView *)view point:(CGPoint)point titles:(NSArray *)titles icons:(NSArray *)icons menuWidth:(CGFloat)menuWidth action:(HHPopupToolDidSelected)action {
    self.black = action;
    
    if (view) {
        [YBPopupMenu showRelyOnView:view titles:titles icons:icons menuWidth:menuWidth otherSettings:^(YBPopupMenu *popupMenu) {
            popupMenu.delegate = self;
        }];
    } else {
        [YBPopupMenu showAtPoint:point titles:titles icons:icons menuWidth:menuWidth otherSettings:^(YBPopupMenu *popupMenu) {
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

@end
