//
//  RCTDeviceCheck.h
//  casa
//
//  Created by ac on 30/12/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

#ifndef RCTDeviceCheck_h
#define RCTDeviceCheck_h

#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

@interface RCTDeviceCheck : NSObject<RCTBridgeModule>

+ (BOOL)deviceCheckCompatibleWithPlatform;

@end

#endif /* RCTDeviceCheck_h */
