//
//  HHAudioTool.h
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHAudioTool : NSObject

/// 音频格式转换成MP3
/// @param sourcePath 源文件路径
/// @param isDelete 是否删除源文件
+ (NSString *)audioToMP3:(NSString *)sourcePath isDeleteSourchFile: (BOOL)isDelete;

@end

NS_ASSUME_NONNULL_END
