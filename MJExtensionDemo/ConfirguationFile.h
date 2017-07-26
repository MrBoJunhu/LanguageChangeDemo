
//
//  ConfirguationFile.h
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/24.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#ifndef ConfirguationFile_h
#define ConfirguationFile_h

#import <UserNotifications/UserNotifications.h>


#define IOS_Version [[[UIDevice currentDevice] systemVersion] floatValue]

#define ENABLE_DEBUG
#ifdef ENABLE_DEBUG
#define DebugLog(format, args...) \
NSLog(@"%s, line %d: " format "\n", \
__func__, __LINE__, ## args);
#else
#define DebugLog(format, args...) do {} while(0)
#endif

#endif /* ConfirguationFile_h */
