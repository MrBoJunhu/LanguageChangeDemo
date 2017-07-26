//
//  NSBundle+Language.m
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/25.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "NSBundle+Language.h"
#import <objc/runtime.h>

static  NSString *languageResourceType = @"lproj";

static const char _bundle = 0;

@interface BundleEx : NSBundle

@end


@implementation BundleEx

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
   
    NSBundle *bundle = objc_getAssociatedObject(self, &bundle);
    
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
    
}

@end

@implementation NSBundle (Language)

+(void)setNewLanguage:(NSString *)language {
    
    static dispatch_once_t onceToken;
  
    dispatch_once(&onceToken, ^{
    
        object_setClass([NSBundle mainBundle], [BundleEx class]);
    
    });
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:languageResourceType];
    
    objc_setAssociatedObject([NSBundle mainBundle], &_bundle, language ? [NSBundle bundleWithPath:path] : nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

@end
