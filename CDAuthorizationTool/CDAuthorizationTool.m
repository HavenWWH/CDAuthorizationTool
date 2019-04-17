//
//  CDAuthorizationTool.m
//  CDProgramme
//
//  Created by 庆中 on 2018/7/3.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

#import "CDAuthorizationTool.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@implementation CDAuthorizationTool

#pragma mark - 相册
+ (void)requestImagePickerAuthorization:(void(^)(CDAuthorizationStatus status, BOOL isFirst))callback {
    
    __block BOOL isF = false;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] ||
        [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        ALAuthorizationStatus authStatus = [ALAssetsLibrary authorizationStatus];
        if (authStatus == ALAuthorizationStatusNotDetermined) { // 未授权
            if ([UIDevice currentDevice].systemVersion.floatValue < 8.0) {
                [self executeCallback:callback status:CDAuthorizationStatusAuthorized requestFirst:isF];
            } else {
                [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                    
                    isF = true;
                    if (status == PHAuthorizationStatusAuthorized) {
                        [self executeCallback:callback status:CDAuthorizationStatusAuthorized requestFirst:isF];
                    } else if (status == PHAuthorizationStatusDenied) {
                        [self executeCallback:callback status:CDAuthorizationStatusDenied requestFirst:isF];
                    } else if (status == PHAuthorizationStatusRestricted) {
                        [self executeCallback:callback status:CDAuthorizationStatusRestricted requestFirst:isF];
                    }
                }];
            }
            
        } else if (authStatus == ALAuthorizationStatusAuthorized) {
            [self executeCallback:callback status:CDAuthorizationStatusAuthorized requestFirst:isF];
        } else if (authStatus == ALAuthorizationStatusDenied) {
            
            [self executeCallback:callback status:CDAuthorizationStatusDenied requestFirst:isF];
        } else if (authStatus == ALAuthorizationStatusRestricted) {
            [self executeCallback:callback status:CDAuthorizationStatusRestricted requestFirst:isF];
        }
    } else {
        [self executeCallback:callback status:CDAuthorizationStatusNotSupport requestFirst:isF];
    }
}

#pragma mark - 相机
+ (void)requestCameraAuthorization:(void(^)(CDAuthorizationStatus status, BOOL isFirst))callback {
    
    __block BOOL isF = false;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                
                isF = true;
                if (granted) {
                    [self executeCallback:callback status:CDAuthorizationStatusAuthorized requestFirst:isF];
                } else {
                    [self executeCallback:callback status:CDAuthorizationStatusDenied requestFirst:isF];
                }
            }];
        } else if (authStatus == AVAuthorizationStatusAuthorized) {
            [self executeCallback:callback status:CDAuthorizationStatusAuthorized requestFirst:isF];
        } else if (authStatus == AVAuthorizationStatusDenied) {
            [self executeCallback:callback status:CDAuthorizationStatusDenied requestFirst:isF];
        } else if (authStatus == AVAuthorizationStatusRestricted) {
            [self executeCallback:callback status:CDAuthorizationStatusRestricted requestFirst:isF];
        }
    } else {
        [self executeCallback:callback status:CDAuthorizationStatusNotSupport requestFirst:isF];
    }
}
#pragma mark - 通讯录
+ (void)requestAddressBookAuthorization:(void (^)(CDAuthorizationStatus status, BOOL isFirst))callback {
    
    __block BOOL isF = false;
    ABAuthorizationStatus authStatus = ABAddressBookGetAuthorizationStatus();
    if (authStatus == kABAuthorizationStatusNotDetermined) {
        __block ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
        if (addressBook == NULL) {
            [self executeCallback:callback status:CDAuthorizationStatusNotSupport requestFirst:isF];
            return;
        }
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            
            isF = true;
            if (granted) {
                [self executeCallback:callback status:CDAuthorizationStatusAuthorized requestFirst:isF];
            } else {
                [self executeCallback:callback status:CDAuthorizationStatusDenied requestFirst:isF];
            }
            if (addressBook) {
                CFRelease(addressBook);
                addressBook = NULL;
            }
        });
        return;
    } else if (authStatus == kABAuthorizationStatusAuthorized) {
        [self executeCallback:callback status:CDAuthorizationStatusAuthorized requestFirst:isF];
    } else if (authStatus == kABAuthorizationStatusDenied) {
        [self executeCallback:callback status:CDAuthorizationStatusDenied requestFirst:isF];
    } else if (authStatus == kABAuthorizationStatusRestricted) {
        [self executeCallback:callback status:CDAuthorizationStatusRestricted requestFirst:isF];
    }
}

//MARK: 录音权限
+ (void)requestRecordingAuthorization:(void (^)(CDAuthorizationStatus status, BOOL isFirst))callback {
    
    __block BOOL isF = false;
    AVAuthorizationStatus recordAuthStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    if (recordAuthStatus == AVAuthorizationStatusNotDetermined) {
        
        [[AVAudioSession sharedInstance] requestRecordPermission:^(BOOL granted) {
            
            isF = true;
            if (granted) {
                [self executeCallback:callback status:CDAuthorizationStatusAuthorized requestFirst:isF];
            } else {
                [self executeCallback:callback status:CDAuthorizationStatusDenied requestFirst:isF];
            }
        }];
    } else if (recordAuthStatus == AVAuthorizationStatusAuthorized) {
        [self executeCallback:callback status:CDAuthorizationStatusAuthorized requestFirst:isF];
    } else if (recordAuthStatus == AVAuthorizationStatusDenied) {
        [self executeCallback:callback status:CDAuthorizationStatusDenied requestFirst:isF];
    } else if (recordAuthStatus == AVAuthorizationStatusRestricted) {
        [self executeCallback:callback status:CDAuthorizationStatusRestricted requestFirst:isF];
    }
}

#pragma mark - callback
+ (void)executeCallback:(void (^)(CDAuthorizationStatus status, BOOL isFirst))callback status:(CDAuthorizationStatus)status requestFirst:(BOOL)isFirst {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (callback) {
            callback(status, isFirst);
        }
    });
}


@end
