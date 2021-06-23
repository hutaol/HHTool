//
//  HHAudioTool.m
//  Pods
//
//  Created by Henry on 2021/6/23.
//

#import "HHAudioTool.h"
#import "lame.h"

@implementation HHAudioTool

+ (NSString *)audioToMP3: (NSString *)sourcePath isDeleteSourchFile:(BOOL)isDelete {
    
    // 输入路径
    NSString *inPath = sourcePath;
    // 判断输入路径是否存在
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:sourcePath]) {
        return nil;
    }
    // 输出路径
    NSString *outPath = [[sourcePath stringByDeletingPathExtension] stringByAppendingString:@".mp3"];
    @try {
        int read, write;
        
        FILE *pcm = fopen([inPath cStringUsingEncoding:1], "rb");  //source 被转换的音频文件位置
        fseek(pcm, 4*1024, SEEK_CUR);                                   //skip file header
        FILE *mp3 = fopen([outPath cStringUsingEncoding:1], "wb");  //output 输出生成的Mp3文件位置
        
        const int PCM_SIZE = 8192;
        const int MP3_SIZE = 8192;
        short int pcm_buffer[PCM_SIZE*2];
        unsigned char mp3_buffer[MP3_SIZE];
        
        lame_t lame = lame_init();
        lame_set_in_samplerate(lame, 11025.0);
        lame_set_VBR(lame, vbr_default);
        lame_init_params(lame);
        
        do {
            size_t size = (size_t)(2 * sizeof(short int));
            read = (int)fread(pcm_buffer, size, PCM_SIZE, pcm);
            if (read == 0)
                write = lame_encode_flush(lame, mp3_buffer, MP3_SIZE);
            else
                write = lame_encode_buffer_interleaved(lame, pcm_buffer, read, mp3_buffer, MP3_SIZE);
            
            fwrite(mp3_buffer, write, 1, mp3);
            
        } while (read != 0);
        
        lame_close(lame);
        fclose(mp3);
        fclose(pcm);
    }
    @catch (NSException *exception) {
        return nil;
    }
    @finally {
        if (isDelete) {
            NSError *error;
            [fm removeItemAtPath:sourcePath error:&error];
        }
        return outPath;
    }
}

@end
