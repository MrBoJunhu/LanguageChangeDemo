//
//  NSUserDefaultsManager.m
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/27.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "NSUserDefaultsManager.h"

@implementation NSUserDefaultsManager

- (instancetype)init{
    
    self = [super init];
    if (self) {
        
    }
    
    return self;
    
}

+(instancetype)shareNSUserDefaultsManager{
    
    static NSUserDefaultsManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}


- (void)groupUserDefaultsSaveObjectWithSuiteName:(NSString *)suiteName object:(id)obj forKey:(NSString *)key{
    
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:suiteName];
    
    [userDefault setObject:obj forKey:key];
    
    [userDefault synchronize];

}

- (id)groupUserDefaultsObjectForKeyWithSuiteName:(NSString *)suiteName key:(NSString *)key {
    
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:suiteName];
    
    return [userDefault objectForKey:key];
    
}

-(void)groupUserDefaultsRemoveObjectForKeyWithSuiteName:(NSString *)suiteName key:(NSString *)key{
    
    NSUserDefaults *userDefault = [[NSUserDefaults alloc] initWithSuiteName:suiteName];

    [userDefault removeObjectForKey:key];
    
}


-(void)userDefaultSaveObject:(id)obj forKey:(NSString *)key {
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    [userDefault setObject:obj forKey:key];
    
}

-(id)userDefaultGetObjectForKey:(NSString *)key {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
}

- (void)userDefaultRemoveObjectForKey:(NSString *)key{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];

    [userDefault removeObjectForKey:key];
    
}

@end
