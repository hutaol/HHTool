//
//  HHAudioRecorder.m
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import "HHAudioRecorder.h"
#import <AVFoundation/AVFoundation.h>
#import "NSString+HHHash.h"
#import "HHAudioTool.h"

NSString *const kHHAudioRecorderNotification = @"kHHAudioRecorderNotification";

@interface HHAudioRecorder ()

@property (nonatomic, strong) AVAudioRecorder *recorder;

@property (nonatomic, copy) NSString *filePath;
@property (nonatomic, copy) NSString *tempFilePath;
@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HHAudioRecorder

static HHAudioRecorder *_audioRecorder;

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_audioRecorder) {
            _audioRecorder = [[self alloc] init];
        }
    });
    return _audioRecorder;
}

- (BOOL)startRecord {
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
    
    NSMutableDictionary *recordSettings = [[NSMutableDictionary alloc] initWithCapacity:10];
    // 音频格式
    [recordSettings setObject:[NSNumber numberWithInt: kAudioFormatLinearPCM] forKey: AVFormatIDKey];
    // 采样率  8000/11025/22050/44100/96000（影响音频的质量）
    //采样率必须要设为11025才能使转化成mp3格式后不会失真
    [recordSettings setObject:[NSNumber numberWithFloat:11025.0] forKey: AVSampleRateKey];
    // 通道的数目,1单声道,2立体声
    [recordSettings setObject:[NSNumber numberWithInt:2] forKey:AVNumberOfChannelsKey];
    // 录音质量
    [recordSettings setObject:[NSNumber numberWithInt: AVAudioQualityMin] forKey:AVEncoderAudioQualityKey];

    self.timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(voiceLevel:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    BOOL createSuccess = [self createDirectory:self.filePath];
    if (!createSuccess) {
        return NO;
    }
        
    self.tempFilePath =  [NSString stringWithFormat:@"%@/%@", self.filePath, [self getFileName]];

    NSURL *url = [NSURL fileURLWithPath:self.tempFilePath];
    NSError *error = nil;
    
    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:recordSettings error:&error];
    
    if (self.recorder.prepareToRecord) {
        self.recorder.meteringEnabled = YES;
        return [self.recorder record];
    } else {
        return NO;
    }
}

- (NSDictionary *)stopRecord {
    [self.timer invalidate];
    self.timer = nil;
    [self.recorder stop];
        
    NSString *path = [HHAudioTool audioToMP3:self.tempFilePath isDeleteSourchFile:YES];
    if (path) {
        NSURL *url = [NSURL fileURLWithPath:path];
        AVURLAsset *audioAsset = [AVURLAsset URLAssetWithURL:url options:nil];
        int duration = (int)CMTimeGetSeconds(audioAsset.duration);
        self.duration = (CGFloat)duration;
        return @{@"path":path, @"duration":@(self.duration)};
    }
    return nil;
}

- (NSDictionary *)stopRecordWav {
    [self.timer invalidate];
    self.timer = nil;
    [self.recorder stop];
        
    if (self.tempFilePath) {
        NSURL *url = [NSURL fileURLWithPath:self.tempFilePath];
        AVURLAsset *audioAsset = [AVURLAsset URLAssetWithURL:url options:nil];
        int duration = (int)CMTimeGetSeconds(audioAsset.duration);
        self.duration = (CGFloat)duration;
        return @{@"path":self.tempFilePath, @"duration":@(self.duration)};
    }
    return nil;
}

- (BOOL)isRecording {
    return self.recorder.isRecording;
}

- (void)cancelRecording {
    [self.timer invalidate];
    self.timer = nil;
    [self.recorder stop];
    [NSFileManager.defaultManager removeItemAtPath:self.tempFilePath error:nil];
}

- (void)voiceLevel:(NSTimer *)timer {
    [self.recorder updateMeters];
    
    float   level;                // The linear 0.0 .. 1.0 value we need.
    float   minDecibels = -80.0f; // Or use -60dB, which I measured in a silent room.
    float   decibels    = [self.recorder averagePowerForChannel:0];
    
    if (decibels < minDecibels) {
        level = 0.0f;
    } else if (decibels >= 0.0f) {
        level = 1.0f;
    } else {
        float   root            = 2.0f;
        float   minAmp          = powf(10.0f, 0.05f * minDecibels);
        float   inverseAmpRange = 1.0f / (1.0f - minAmp);
        float   amp             = powf(10.0f, 0.05f * decibels);
        float   adjAmp          = (amp - minAmp) * inverseAmpRange;
        
        level = powf(adjAmp, 1.0f / root);
    }
    /* level 范围[0 ~ 1], 转为[0 ~100] 之间 */
    dispatch_async(dispatch_get_main_queue(), ^{
//        self->_currentVoiceLevel = (int)(level * 100);
        [NSNotificationCenter.defaultCenter postNotificationName:kHHAudioRecorderNotification object:nil userInfo:@{@"voiceLevel":@((int)(level * 100))}];
    });
}

//MARK: - Getter

- (NSString *)filePath {
    if (!_filePath) {
        _filePath = [self getFileCachePath:@"/HHAudioRecorder/voice"];;
    }
    return _filePath;
}

- (NSString *)getFileName {
    NSString *uuid = [[NSUUID UUID] UUIDString];
    NSString *name = [NSString stringWithFormat:@"%@.%@", uuid.hh_md5String, @"wav"];
    return name;
}

- (BOOL)createDirectory:(NSString *)filePath {
    if (!filePath || filePath.length == 0) {
        return NO;
    }
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:filePath]) {
        return YES;
    }
    BOOL succ = [fileManager createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    return succ;
}

- (NSString *)getFileCachePath:(NSString *)fileName {
    if (!fileName) {
        return nil;
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDirectory = [paths objectAtIndex:0];
    NSString *fileFullPath = [cacheDirectory stringByAppendingPathComponent:fileName];
    return fileFullPath;
}

@end
