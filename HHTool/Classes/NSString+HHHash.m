//
//  NSString+HHHash.m
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import "NSString+HHHash.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation NSString (HHHash)

- (NSString *)hh_md5String {
    const char *string = self.UTF8String;
    int length = (int)strlen(string);
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(string, length, bytes);
    return [self hh_stringFromBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}

- (NSString *)hh_stringFromBytes:(unsigned char *)bytes length:(int)length {
    NSMutableString *mutableString = @"".mutableCopy;
    for (int i = 0; i < length; i++)
        [mutableString appendFormat:@"%02x", bytes[i]];
    return [NSString stringWithString:mutableString];
}

@end
