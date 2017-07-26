//
//  AppDelegate.m
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/24.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    NSLog(@"语言 : \n%@",  [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"]);
    
    [[LanguageManager sharedInstance] changeNowLanguage];
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {

    
}



- (void)applicationDidEnterBackground:(UIApplication *)application {

}


- (void)applicationWillEnterForeground:(UIApplication *)application {

}


- (void)applicationDidBecomeActive:(UIApplication *)application {

    [application setApplicationIconBadgeNumber:1];
    [application setApplicationIconBadgeNumber:0];

}


- (void)applicationWillTerminate:(UIApplication *)application {

    
    
}

#pragma mark - 这个函数存在的意义在于：当用户在设置中关闭了通知时，程序启动时会调用此函数，我们可以获取用户的设置

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    
    DebugLog(@"notificationSettings: \n %@", notificationSettings);
    
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    DebugLog(@"userInfo : %@", userInfo);
    
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
 
    
}

#pragma mark - 点击本地通知, 在前台的时候不弹出通知但是可以处理通知

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    DebugLog(@"%@", notification.userInfo[@"name"]);

}





#pragma mark -  弹出通知栏

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    
    DebugLog(@"notification : %@", notification);
    
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionSound);
    
}



@end
