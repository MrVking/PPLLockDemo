//
//  PPLLockHelper.h
//  PPLLockDemo
//
//  Created by Samuel on 2019/1/10.
//  Copyright © 2019年 Populstay. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PPLLockHelperClass [PPLLockHelper shareInstance]

#define PPLObjectPPLLockHelper [[PPLLockHelper shareInstance] PPLObject]

typedef void(^BLEBlock)(BOOL succeed,id info);

@interface PPLLockHelper : NSObject<PPLLockDelegate>

+ (instancetype)shareInstance;

@property (strong, nonatomic) PPLLock * PPLObject;

@property (strong, nonatomic) PPLKeyModel * currentKey;

+ (void)connectKey:(PPLKeyModel *)key connectBlock:(BLEBlock)connectBloc;


+ (void)GetElectricBlock:(BLEBlock)electricBlock;

+ (void)GetDeviceInfoBlock:(BLEBlock)deviceInfoBlock;

+ (void)disconnectBlock:(BLEBlock)disConnectBlock;

+ (void)unlock:(PPLKeyModel *)key unlockBlock:(BLEBlock)unlockBlock;

+ (void)lock:(PPLKeyModel *)key lockBlock:(BLEBlock)lockBlock;
+ (void)setLockTime:(PPLKeyModel*)key complition:(BLEBlock)complition;
+ (void)pullUnlockRecord:(PPLKeyModel *)key complition:(BLEBlock)complition;
+ (void)resetKeyboardPassword:(PPLKeyModel *)key complition:(BLEBlock)complition;
+ (void)resetLock:(PPLKeyModel *)key  complition:(BLEBlock)complition;
+ (void)customKeyboardPwd:(NSString *)newKeyboardPwd
                startDate:(NSDate*)startDate
                  endDate:(NSDate*)endDate
                      key:(PPLKeyModel *)key
               complition:(BLEBlock)complition;

+ (void)GetLockTimeComplition:(BLEBlock)complition;


+ (void)setAutoLockingTime:(int)time key:(PPLKeyModel *)key complition:(BLEBlock)complition;


@end

