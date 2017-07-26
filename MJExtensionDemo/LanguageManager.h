//
//  LanguageManager.h
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/25.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

#define APPLELANGUAGES @"AppleLanguages"

#define APPLANGUAGE_CHANGED @"Applanguages_changed"

#define LANGUAGE_SET @"LANGUAGE_SET"

#define CNS @"zh-Hans"
#define EN @"en"
#define JAP @"ja"



#define FGGetStringWithKeyFromTable(key, tbl) [[LanguageManager sharedInstance] getStringForKey:key withTable:tbl]


@interface LanguageManager : NSObject


#pragma mark - 工具

+(id)sharedInstance;

/**
 *  返回table中指定的key的值
 *
 *  @param key   key
 *  @param table table
 *
 *  @return 返回table中指定的key的值
 */
-(NSString *)getStringForKey:(NSString *)key withTable:(NSString *)table;

/**
 *  改变当前语言
 */
-(void)changeNowLanguage;

/**
 *  设置新的语言
 *
 *  @param language 新语言
 */
-(void)setNewLanguage:(NSString*)language;

- (void)resetRootViewController;

@end
