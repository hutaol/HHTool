//
//  HHAudioRecorder.h
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import <Foundation/Foundation.h>

/// 通知 声音大小  voiceLevel [0 ~100] 0.5s一次
FOUNDATION_EXTERN NSString * _Nonnull const kHHAudioRecorderNotification;

NS_ASSUME_NONNULL_BEGIN

@interface HHAudioRecorder : NSObject

/// 单例对象
+ (instancetype)shared;

/// 开始录音
- (BOOL)startRecord;

/// 结束录音，返回录音文件完整路径(path)及时长(duration秒) mp3
- (NSDictionary *)stopRecord;

/// 结束录音，返回录音文件完整路径(path)及时长(duration秒) wav
- (NSDictionary *)stopRecordWav;

/// 是否正在录音中
- (BOOL)isRecording;

/// 取消录音
- (void)cancelRecording;

@end

NS_ASSUME_NONNULL_END
