//
//  CDAuthorizationTool.h
//  CDProgramme
//
//  Created by 庆中 on 2018/7/3.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

@import Foundation;
@import UIKit;
@import AssetsLibrary;
@import Photos;
@import AddressBook;
@import Contacts;
@import AVFoundation;
@import CoreBluetooth;
@import EventKit;
@import Speech;


typedef NS_ENUM(NSUInteger, CDPrivacyType){
    CDPrivacyTypeNone               = 0,
    CDPrivacyTypePhotos             = 1,// 照片
    CDPrivacyTypeCamera             = 2,// 相机
    CDPrivacyTypeMicrophone         = 3,// 麦克风
    CDPrivacyTypeAddressBook        = 4,// 通讯录
    CDPrivacyTypeCalendars          = 5,// 日历
    CDPrivacyTypeReminders          = 6,// 提醒事项
    CDPrivacyTypeSpeechRecognition  = 7,// 语音识别 >= iOS10
};

typedef NS_ENUM(NSUInteger, CDAuthorizationStatus) {
    CDAuthorizationStatusAuthorized = 0,    // 已授权
    CDAuthorizationStatusDenied,            // 拒绝
    CDAuthorizationStatusRestricted,        // 应用没有相关权限，且当前用户无法改变这个权限，比如:家长控制
    CDAuthorizationStatusNotSupport         // 硬件等不支持
};

//typedef void(^accessForTypeResultBlock)(ECAuthorizationStatus status, ECPrivacyType type);
//
//
@interface CDAuthorizationTool : NSObject

/**
 请求对应的权限

 @param type 权限类型
 @param callback 返回权限状态，和是否是is第一次授权
 */
+ (void)requestPrivacyType:(CDPrivacyType)type authorizationStatus:(void(^)(CDAuthorizationStatus status, BOOL isFirstAuthorization))callback;


@end
