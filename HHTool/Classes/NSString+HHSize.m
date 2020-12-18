//
//  NSString+HHSize.m
//  Pods
//
//  Created by Henry on 2020/12/18.
//

#import "NSString+HHSize.h"

@implementation NSString (HHSize)

- (CGSize)hh_textSizeInFont:(UIFont *)font {
    return [self hh_textSizeIn:CGSizeZero font:font breakMode:NSLineBreakByWordWrapping align:NSTextAlignmentLeft];
}

- (CGSize)hh_textSizeIn:(CGSize)size font:(UIFont *)font {
    return [self hh_textSizeIn:size font:font breakMode:NSLineBreakByWordWrapping align:NSTextAlignmentLeft];
}

- (CGSize)hh_textSizeIn:(CGSize)size font:(UIFont *)font breakMode:(NSLineBreakMode)abreakMode align:(NSTextAlignment)alignment {
    CGSize resultSize = CGSizeZero;
    if (self.length <= 0) {
        return resultSize;
    }
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    resultSize = [self boundingRectWithSize:CGSizeMake(floor(size.width), floor(size.height))//用相对小的 width 去计算 height / 小 heigth 算 width
                                    options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin)
                                 attributes:@{NSFontAttributeName: font,
                                              NSParagraphStyleAttributeName: style}
                                    context:nil].size;
    resultSize = CGSizeMake(floor(resultSize.width + 1), floor(resultSize.height + 1));//上面用的小 width（height） 来计算了，这里要 +1
    return resultSize;
}

@end
