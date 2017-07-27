//
//  LanguageManager.m
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/25.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "LanguageManager.h"

#import "AppDelegate.h"

#define LANGUAGE_FILE_TYPE @"lproj"

@interface LanguageManager()

@property (nonatomic, copy) NSString *language;

@property (nonatomic, strong) NSBundle *bundle;

@end

@implementation LanguageManager

#pragma mark - 重新设置语言

+(id)sharedInstance {

    static LanguageManager *manager = nil;
    
    static dispatch_once_t onceToken;
   
    dispatch_once(&onceToken, ^{
    
        manager = [[self alloc] init];
    
    });
    
    return manager;
    
}


-(instancetype)init {
    self = [super init];
    if (self)
    {
        [self initLanguage];
    }
    
    return self;
}

-(void)initLanguage
{
    NSString *tmp = [[NSUserDefaults standardUserDefaults] objectForKey:LANGUAGE_SET];
    
    NSString *path;
    
    //默认是中文
    if (!tmp)
    {
        tmp = CNS;
    }
//    else
//    {
//        tmp = EN;
//    }
    
    self.language = tmp;
    path = [[NSBundle mainBundle]pathForResource:self.language ofType:LANGUAGE_FILE_TYPE];
    self.bundle = [NSBundle bundleWithPath:path];
}

-(NSString *)getStringForKey:(NSString *)key withTable:(NSString *)table {
    if (self.bundle)
    {
        return NSLocalizedStringFromTableInBundle(key, table, self.bundle, @"");
    }
    
    return NSLocalizedStringFromTable(key, table, @"");
}

-(void)changeNowLanguage {
    
    if ([self.language isEqualToString:EN])
    {
        [self setNewLanguage:CNS];
    
    }else{
        [self setNewLanguage:EN];
    }
}

-(void)setNewLanguage:(NSString *)language
{
    if ([language isEqualToString:self.language])
    {
        return;
    }
    
    //只支持中英文的
//    if ([language isEqualToString:EN] || [language isEqualToString:CNS])
//    {
//        NSString *path = [[NSBundle mainBundle]pathForResource:language ofType:@"lproj"];
//        self.bundle = [NSBundle bundleWithPath:path];
//    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:LANGUAGE_FILE_TYPE];
    
    self.bundle = [NSBundle bundleWithPath:path];
    
    self.language = language;
    
    [[NSUserDefaults standardUserDefaults]setObject:language forKey:LANGUAGE_SET];
  
    [[NSUserDefaults standardUserDefaults] synchronize];
    
     [self resetRootViewController];
     
}


- (void)resetRootViewController {
    
    AppDelegate *appDelegate =
    (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *rootNav = [storyBoard instantiateViewControllerWithIdentifier:@"rootnav"];
    
    rootNav.tabBarItem.title = FGGetStringWithKeyFromTable(k_HomePage, k_BB_Table1);
    
    UINavigationController *personNav = [storyBoard instantiateViewControllerWithIdentifier:@"personnav"];
    
    personNav.tabBarItem.title = FGGetStringWithKeyFromTable(k_Mine, k_BB_Table1);
    
    UITabBarController *tabVC = (UITabBarController*)appDelegate.window.rootViewController;
    
    UINavigationController *shoppingNav = [storyBoard instantiateViewControllerWithIdentifier:@"shoppingnav"];
    
    shoppingNav.navigationItem.title = FGGetStringWithKeyFromTable(k_Shopping, k_BB_Table1);
    shoppingNav.tabBarItem.title = FGGetStringWithKeyFromTable(k_Shopping, k_BB_Table1);
    
    
    UINavigationController *kindNav = [storyBoard instantiateViewControllerWithIdentifier:@"kindnav"];
    kindNav.navigationItem.title = FGGetStringWithKeyFromTable(k_Kind, k_BB_Table1);
    kindNav.tabBarItem.title = FGGetStringWithKeyFromTable(k_Kind, k_BB_Table1);
    
    tabVC.viewControllers = @[rootNav,kindNav,shoppingNav, personNav];
    
    
    id  isFromWidgets = [[NSUserDefaultsManager shareNSUserDefaultsManager] groupUserDefaultsObjectForKeyWithSuiteName:groupID key:isFromWidgets_Key];
    
    if (isFromWidgets) {
        
        id selectedIndex = [[NSUserDefaultsManager shareNSUserDefaultsManager]groupUserDefaultsObjectForKeyWithSuiteName:groupID key:selectedRow];
        
        tabVC.selectedIndex = [selectedIndex integerValue];
        
        [[NSUserDefaultsManager shareNSUserDefaultsManager] groupUserDefaultsRemoveObjectForKeyWithSuiteName:groupID key:isFromWidgets_Key];
  
    }
    
}

- (void)postChangedLanguage {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:APPLANGUAGE_CHANGED object:nil];
    
}


@end
