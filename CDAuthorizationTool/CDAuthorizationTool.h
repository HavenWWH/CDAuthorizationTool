//
//  CDAuthorizationTool.h
//  CDProgramme
//
//  Created by 庆中 on 2018/7/3.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CDAuthorizationStatus) {
    CDAuthorizationStatusAuthorized = 0,    // 已授权
    CDAuthorizationStatusDenied,            // 拒绝
    CDAuthorizationStatusRestricted,        // 应用没有相关权限，且当前用户无法改变这个权限，比如:家长控制
    CDAuthorizationStatusNotSupport         // 硬件等不支持
};

@interface CDAuthorizationTool : NSObject

/**
 请求相册访问权限
 
 @param callback 是否授权
 */
+ (void)requestImagePickerAuthorization:(void(^)(CDAuthorizationStatus status, BOOL isFirst))callback;


/**
 请求相机权限
 
 @param callback 是否授权
 */
+ (void)requestCameraAuthorization:(void(^)(CDAuthorizationStatus status, BOOL isFirst))callback;


/**
 请求通讯录权限
 
 @param callback 是否授权
 */
+ (void)requestAddressBookAuthorization:(void (^)(CDAuthorizationStatus status, BOOL isFirst))callback;


/**
 请求录音权限
 
 @param callback 是否授权
 */
+ (void)requestRecordingAuthorization:(void (^)(CDAuthorizationStatus status, BOOL isFirst))callback;

@end
