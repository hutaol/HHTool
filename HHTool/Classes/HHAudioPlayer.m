//
//  HHAudioPlayer.m
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import "HHAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface HHAudioPlayer () <AVAudioPlayerDelegate>

@end

@implementation HHAudioPlayer

static HHAudioPlayer *_audioPlayer;

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_audioPlayer) {
            _audioPlayer = [[self alloc] init];
        }
    });
    return _audioPlayer;
}

- (void)playWithURL:(NSString *)url {
    // TODO 网络包含http
    if ([url containsString:@"http"]) {
        [self playNetworkWithURL:url];
    } else {
        [self playLocalWithURL:url];
    }
}

- (void)playNetworkWithURL:(NSString *)url {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:url]];
    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:item];
    [player play];
}

- (void)playLocalWithURL:(NSString *)url {
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil];
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL URLWithString:url] error:nil];
    audioPlayer.volume = 1;
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}

@end
