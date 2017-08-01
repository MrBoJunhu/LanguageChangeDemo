
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
#define UIColorFromRGB1(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



#define ENABLE_DEBUG
#ifdef ENABLE_DEBUG
#define DebugLog(format, args...) \
NSLog(@"%s, line %d: " format "\n", \
__func__, __LINE__, ## args);
#else
#define DebugLog(format, args...) do {} while(0)
#endif

#endif /* ConfirguationFile_h */
