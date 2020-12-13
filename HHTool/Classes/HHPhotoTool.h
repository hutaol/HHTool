//
//  HHPhotoTool.h
//  Pods
//
//  Created by Henry on 2020/11/16.
//

#import <Foundation/Foundation.h>
@class HHPhotoModel;

NS_ASSUME_NONNULL_BEGIN

typedef void (^HHPhotoToolCompletion)(HHPhotoModel *model);
typedef void (^HHPhotoToolMultipleCompletion)(NSArray <HHPhotoModel *> *images);

@interface HHPhotoTool : NSObject


/// 选择头像图片，裁剪正方形
+ (void)sheetPortraitWithController:(UIViewController *)vc title:(NSString *)title completion:(HHPhotoToolCompletion)completion;


/// sheet 相册|拍照
+ (void)sheetImagePickerWithController:(UIViewController *)vc title:(NSString *)title count:(NSInteger)count edit:(BOOL)edit completion:(HHPhotoToolMultipleCompletion)completion;


/// 单张
+ (void)imagePickerSingleWithController:(UIViewController *)vc seletedVideo:(BOOL)seletedVideo edit:(BOOL)edit completion:(HHPhotoToolCompletion)completion;


/// 选择多张图片
+ (void)imagePickerMultipleWithController:(UIViewController *)vc count:(NSInteger)count seletedVideo:(BOOL)seletedVideo completion:(HHPhotoToolMultipleCompletion)completion;


/// 拍照|视频 默认可编辑
+ (void)cameraWithController:(UIViewController *)vc video:(BOOL)video system:(BOOL)system completion:(HHPhotoToolCompletion)completion;
+ (void)cameraWithController:(UIViewController *)vc video:(BOOL)video edit:(BOOL)edit system:(BOOL)system completion:(HHPhotoToolCompletion)completion;


/// 预览图片|视频
/// @param vc sender
/// @param source 3种类型 NSURL UIImage NSString(路径)
/// @param previews 小图imageView
/// @param index 第几张
+ (void)showImageWithController:(UIViewController *)vc source:(NSArray *)source previews:(nullable NSArray *)previews index:(NSInteger)index;


/// 编辑图片|视频
/// @param vc sender
/// @param source 2种类型 NSURL UIImage
/// @param isVideo 是否是视频
/// @param completion 回调
+ (void)editImageWithController:(UIViewController *)vc source:(id)source isVideo:(BOOL)isVideo completion:(HHPhotoToolCompletion)completion;

@end


@interface HHPhotoModel : NSObject

@property (nonatomic, strong) UIImage * _Nullable image;
@property (nonatomic, strong) NSURL * _Nullable videoURL;

@property (nonatomic, assign) BOOL isVideo;

+ (instancetype)modelWithImage:(nullable UIImage *)image video:(nullable NSURL *)video isVideo:(BOOL)isVideo;

@end

NS_ASSUME_NONNULL_END
