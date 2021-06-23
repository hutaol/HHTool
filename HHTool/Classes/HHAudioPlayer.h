//
//  HHAudioPlayer.h
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHAudioPlayer : NSObject

+ (instancetype)shared;

/// 播放音频
- (void)playWithURL:(NSString *)url;

/// 根据路径播放网络音频文件，不能播放本地
- (void)playNetworkWithURL:(NSString *)url;

/// 根据路径播放本地音频文件，不能播放网络
- (void)playLocalWithURL:(NSString *)url;

@end

NS_ASSUME_NONNULL_END
