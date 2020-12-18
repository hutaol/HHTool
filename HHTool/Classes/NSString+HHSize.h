//
//  NSString+HHSize.h
//  Pods
//
//  Created by Henry on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HHSize)

- (CGSize)hh_textSizeInFont:(UIFont *)font;

- (CGSize)hh_textSizeIn:(CGSize)size font:(UIFont *)font;

- (CGSize)hh_textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)abreakMode align:(NSTextAlignment)alignment;

@end

NS_ASSUME_NONNULL_END
