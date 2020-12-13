//
//  HHUIImagePicker.m
//  Pods
//
//  Created by Henry on 2020/11/19.
//

#import "HHUIImagePicker.h"
#import "HHAlertTool.h"
#import "HHDefine.h"
#import <CoreServices/CoreServices.h>


@interface HHUIImagePicker () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    UIImagePickerController     *_imgPickC;
    UIViewController            *_vc;
    CallBackBlock                _callBackBlock;
}

@end

@implementation HHUIImagePicker

+ (instancetype)shareInstance
{
    static dispatch_once_t once;
    static HHUIImagePicker *pickManager;
    dispatch_once(&once, ^{
        pickManager = [[HHUIImagePicker alloc] init];
    });
    
    return pickManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        if(!_imgPickC) {
            _imgPickC = [[UIImagePickerController alloc] init];  // 初始化 _imgPickC
            _videoMaximumDuration = 60;
        }
    }
    return self;
}

- (void)presentPicker:(PickerType)pickerType target:(UIViewController *)vc callBackBlock:(CallBackBlock)callBackBlock {
    _vc = vc;
    _callBackBlock = callBackBlock;
    if(pickerType == PickerType_Camera || pickerType == PickerType_Take) {
        // 拍照
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            _imgPickC.delegate = self;
            _imgPickC.sourceType = UIImagePickerControllerSourceTypeCamera;
            _imgPickC.showsCameraControls = YES;
            
            // 录制
            if (pickerType == PickerType_Take) {
                _imgPickC.mediaTypes = @[(NSString *)kUTTypeMovie];
                _imgPickC.videoQuality = UIImagePickerControllerQualityTypeIFrame1280x720;
                _imgPickC.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
                _imgPickC.videoMaximumDuration = self.videoMaximumDuration;
                
                _imgPickC.allowsEditing = YES;

            } else {
                _imgPickC.allowsEditing = NO;

            }
            
            UIView *view = [[UIView  alloc] init];
            view.backgroundColor = [UIColor grayColor];
            _imgPickC.cameraOverlayView = view;
            [_vc presentViewController:_imgPickC animated:YES completion:nil];
        } else {
            [HHAlertTool alertWithMessage:GetLocalLanguageTextValue(@"CameraNotAvailable")];
        }
    } else if (pickerType == PickerType_Photo) {
        // 相册
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
            _imgPickC.delegate = self;
            _imgPickC.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            _imgPickC.allowsEditing = YES;
            [_vc presentViewController:_imgPickC animated:YES completion:nil];
        } else {
            [HHAlertTool alertWithMessage:GetLocalLanguageTextValue(@"CameraNotAvailable")];
        }

    }
}

#pragma mark ---- UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [_vc dismissViewControllerAnimated:YES completion:^{
        self->_callBackBlock(info, NO); // block回调
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [_vc dismissViewControllerAnimated:YES completion:^{
        self->_callBackBlock(nil, YES); // block回调
    }];
}

@end
