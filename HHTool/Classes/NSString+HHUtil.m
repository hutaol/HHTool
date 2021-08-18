//
//  NSString+HHUtil.m
//  Pods
//
//  Created by Henry on 2021/8/18.
//

#import "NSString+HHUtil.h"

@implementation NSString (HHUtil)

+ (BOOL)hh_isEmpty:(NSString *)str {
    if (!str ||
        [str isKindOfClass:[NSNull class]] ||
        !str.length ||
        ![str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length ||
        [str isEqualToString:@"<null>"] ||
        [str isEqualToString:@"(null)"] ||
        [str isEqualToString:@"null"] ||
        [str isEqualToString:@"nil"]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)hh_isNotEmpty:(NSString *)str {
    return ![self isEmpty:str];
}

- (NSString *)hh_trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
