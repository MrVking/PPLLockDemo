//
//  PPLKeyModel.h
//  PPLLockDemo
//
//  Created by Samuel on 2019/1/7.
//  Copyright © 2019年 Populstay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPLKeyModel : NSObject

@property (strong, nonatomic)NSString * lockId;


@property (strong, nonatomic)NSString * accessToken;

@property (strong, nonatomic)NSString * name;

@property (strong, nonatomic)NSString * mac;


@property (assign, nonatomic)NSString * timestamp;

@property (assign, nonatomic)NSString * electricQuantity;

@property (assign, nonatomic)NSString * timezoneRawOffSet;

@property (strong, nonatomic)NSString * hardwareVersion;

@property (assign, nonatomic)NSString * protocolVersion;

@property (strong, nonatomic)NSString * firwareVersion;

@end
