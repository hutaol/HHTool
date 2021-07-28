//
//  NSDate+HHTime.h
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (HHTime)

/// 转时间戳（13位 毫秒）
- (NSString *)toTimestamp;

/// 转字符串
/// @param format  默认：yyyy-MM-dd HH:mm
- (NSString *)toStringWithFormat:(nullable NSString *)format;
- (NSString *)toString;

/// 时间转时间戳（毫秒）
/// @param date date=nil为当前时间
/// @return 时间戳 毫秒13位
+ (NSString *)timestamp:(nullable NSDate *)date;

/// 时间转字符串
/// @param date  date=nil为当前时间
/// @param format 默认：yyyy-MM-dd HH:mm
+ (NSString *)string:(nullable NSDate *)date format:(nullable NSString *)format;
+ (NSString *)string:(nullable NSDate *)date;

/// 时间戳转NSDate
/// @param timestamp 时间戳
+ (NSDate *)date:(nullable NSString *)timestamp;

/// 字符串转NSDate
/// @param string 字符串
/// @param format 默认：yyyy-MM-dd HH:mm
+ (NSDate *)dateForString:(nullable NSString *)string format:(nullable NSString *)format;
+ (NSDate *)dateForString:(nullable NSString *)string;

/// 字符串转时间戳(毫秒)
+ (NSString *)timestampForString:(NSString *)string format:(nullable NSString *)format;
+ (NSString *)timestampForString:(NSString *)string;

/// 时间戳转字符串(毫秒)
+ (NSString *)stringForTimestamp:(NSString *)timestamp format:(nullable NSString *)format;
+ (NSString *)stringForTimestamp:(NSString *)timestamp;

@end

NS_ASSUME_NONNULL_END
