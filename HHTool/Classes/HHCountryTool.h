//
//  HHCountryTool.h
//  Pods
//
//  Created by Henry on 2020/12/29.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHCountry : NSObject

@property (nonatomic, copy) NSString *countryCode;
@property (nonatomic, copy) NSString *countryName;
@property (nonatomic, copy) NSString *countryPinyin;
@property (nonatomic, copy) NSString *phoneCode;

- (instancetype)initWithName:(NSString *)name code:(NSString *)code phoneCode:(NSString *)phoneCode pinyin:(NSString *)pinyin;

@end

@interface HHCountryTool : NSObject

+ (instancetype)sharedInstance;

+ (void)attempDealloc;

- (void)getCountryCompelete:(void(^)(NSArray<HHCountry *> *dataArray))compelete;

- (void)getCountrySection:(BOOL)showCurrent compelete:(void(^)(NSArray<HHCountry *> *dataArray, NSArray<HHCountry *> *sectionArray, NSArray<NSString *> *sectionTitlesArray))compelete;

- (void)getCountrySectionCompelete:(void(^)(NSArray<HHCountry *> *dataArray, NSArray<HHCountry *> *sectionArray, NSArray<NSString *> *sectionTitlesArray))compelete;

- (HHCountry *)getlocaleCountry;

- (HHCountry *)findCountry:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
