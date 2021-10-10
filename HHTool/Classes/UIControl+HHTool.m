//
//  UIControl+HHTool.m
//  Pods
//
//  Created by Henry on 2021/9/29.
//

#import "UIControl+HHTool.h"
#import <objc/runtime.h>

@implementation UIControl (HHTool)

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";
static const char *UIControl_ignoreEvent = "UIControl_ignoreEvent";

- (NSTimeInterval)hh_acceptEventInterval {
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

- (void)setHh_acceptEventInterval:(NSTimeInterval)hh_acceptEventInterval {
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(hh_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)hh_ignoreEvent {
    return [objc_getAssociatedObject(self, UIControl_ignoreEvent) doubleValue];
}

- (void)setHh_ignoreEvent:(BOOL)hh_ignoreEvent {
    objc_setAssociatedObject(self, UIControl_ignoreEvent, @(hh_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load {
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(__hh_sendAction:to:forEvent:));
    method_exchangeImplementations(a, b);
}

- (void)__hh_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if (self.hh_ignoreEvent) {
        return;
    }
    if (self.hh_acceptEventInterval > 0) {
        self.hh_ignoreEvent = YES;
        [self performSelector:@selector(setHh_ignoreEvent:) withObject:@(NO) afterDelay:self.hh_acceptEventInterval];
    }
    [self __hh_sendAction:action to:target forEvent:event];
}

@end
