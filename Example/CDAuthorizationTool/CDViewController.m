//
//  CDViewController.m
//  CDAuthorizationTool
//
//  Created by cqz on 01/15/2019.
//  Copyright (c) 2019 cqz. All rights reserved.
//

#import "CDViewController.h"
#import "CDAuthorizationTool.h"

@interface CDViewController ()


@end

@implementation CDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    [CDAuthorizationTool requestRecordingAuthorization:^(CDAuthorizationStatus status, BOOL isFirst) {

        NSLog(@"授权：%@", isFirst ? @"是第一次授权" : @"不是第一次授权");

        if (status == CDAuthorizationStatusAuthorized) {

            NSLog(@"已经授权");
        } else if (status == CDAuthorizationStatusDenied) {

            NSLog(@"用户拒绝");
        }
    }];
    
//    [CDAuthorizationTool requestAddressBookAuthorization:^(CDAuthorizationStatus status, BOOL isFirst) {
//
//        NSLog(@"授权：%@", isFirst ? @"是第一次授权" : @"不是第一次授权");
//
//        if (status == CDAuthorizationStatusAuthorized) {
//
//            NSLog(@"已经授权");
//        } else if (status == CDAuthorizationStatusDenied) {
//
//            NSLog(@"用户拒绝");
//        }
//    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
