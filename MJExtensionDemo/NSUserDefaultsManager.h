//
//  NSUserDefaultsManager.h
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/27.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaultsManager : NSObject

+(instancetype)shareNSUserDefaultsManager;

- (void)groupUserDefaultsSaveObjectWithSuiteName:(NSString *)suiteName object:(id)obj forKey:(NSString *)key;

- (id)groupUserDefaultsObjectForKeyWithSuiteName:(NSString *)suiteName key:(NSString *)key;

- (void)groupUserDefaultsRemoveObjectForKeyWithSuiteName:(NSString *)suiteName key:(NSString *)key;



-(void)userDefaultSaveObject:(id)obj forKey:(NSString *)key;

-(id)userDefaultGetObjectForKey:(NSString *)key;

- (void)userDefaultRemoveObjectForKey:(NSString *)key;


@end
