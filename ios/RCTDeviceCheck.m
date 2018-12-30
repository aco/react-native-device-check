//
//  RCTDeviceCheck.m
//  casa
//
//  Created by ac on 30/12/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import <DeviceCheck/DeviceCheck.h>

#include "RCTDeviceCheck.h"

typedef void (^FailureHandleBlock)(NSString *errorDescription); // Rejector wrapper - RN does not support multiple callback invocations

@implementation RCTDeviceCheck

+ (BOOL)deviceCheckCompatibleWithPlatform
{
  if (@available(iOS 11.0, *)) {
    return DCDevice.currentDevice.isSupported;
  }
  
  return false;
}

RCT_EXPORT_MODULE();

RCT_REMAP_METHOD(getDeviceToken,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejector:(RCTPromiseRejectBlock)reject)
{
  FailureHandleBlock failureHandle = ^void(NSString *errorDescription) {
    reject(nil, [NSString stringWithFormat:@"%@ (DeviceCheck API unsupported in simulator)", errorDescription], nil);
  };
  
  if (RCTDeviceCheck.deviceCheckCompatibleWithPlatform) {
    
    [DCDevice.currentDevice generateTokenWithCompletionHandler:^(NSData * _Nullable token, NSError * _Nullable error) {
      if (error) {
        failureHandle(error.localizedDescription);
      } else if (token.length < 1) {
        failureHandle(@"Token creation failure");
      } else {
        resolve([token base64EncodedStringWithOptions:0]);
      }
    }];
  } else {
    failureHandle(@"Platform incompatible");
  }
}

@end
