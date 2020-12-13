//
//  HHUIImagePicker.h
//  Pods
//
//  Created by Henry on 2020/11/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, PickerType) {
    PickerType_Photo, // 照片
    PickerType_Camera = 0, // 拍照
    PickerType_Take,  // 拍摄
};

typedef void(^CallBackBlock)( NSDictionary * _Nullable infoDict, BOOL isCancel);  // 回调


@interface HHUIImagePicker : NSObject

/// 相机视频录制最大秒数  -  默认60s
@property (nonatomic, assign) NSTimeInterval videoMaximumDuration;

+ (instancetype)shareInstance; // 单例

- (void)presentPicker:(PickerType)pickerType target:(UIViewController *)vc callBackBlock:(CallBackBlock)callBackBlock;

@end

NS_ASSUME_NONNULL_END
