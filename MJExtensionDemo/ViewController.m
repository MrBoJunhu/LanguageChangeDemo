//
//  ViewController.m
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/24.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "StatusModel.h"
#import <MJExtension.h>


@interface ViewController ()

@property (strong, nonatomic) IBOutlet UIButton *addBtn;

@property (strong, nonatomic) IBOutlet UIButton *removeBtn;

@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;

@property (strong, nonatomic) IBOutlet UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    

    NSDictionary *dict = @{
                           @"name" : @"Jack",
                           @"icon" : @"lufy.png",
                           @"age" : @20,
                           @"height" : @"1.55",
                           @"money" : @100.9,
                           @"sex" : @(SexFemale)
                           };
    
    User *currentUser = [User mj_objectWithKeyValues:dict];
    
    NSLog(@" name : %@", currentUser.name);
    
    
    NSDictionary *responseDic = @{
                           @"text" : @"是啊，今天天气确实不错！",
                           @"user" : @{
                                   @"name" : @"Jack",
                                   @"icon" : @"lufy.png"
                                   },
                           @"retweetedStatus" : @{
                                   @"text" : @"今天天气真不错！",
                                   @"user" : @{
                                           @"name" : @"Rose",
                                           @"icon" : @"nami.png"
                                           }
                                   }            
                           };
    
    
    StatusModel *stModel = [StatusModel mj_objectWithKeyValues:responseDic];
    
    NSLog(@"%@ \n stModel.retweetedStatus.user.name:%@ ",stModel.text, stModel.retweetedStatus.user.name);

    
    [self InternationalizationFunctionWithLocalizable];
       
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTitle) name:APPLANGUAGE_CHANGED object:nil];
    
}


- (IBAction)internationalAction:(id)sender {
    
    @weakify(self);

    [ShowMessageObject showMessageWithController:self Title:@"国际化文件路径" message:@"请选择您需要切换的语言文件" style:UIAlertControllerStyleActionSheet cancelStyle:UIAlertActionStyleCancel actionTitles:@[@"Localizable",k_BB_Table1] cancelTitle:@"取消" clickChooseAction:^(NSUInteger index) {
      
        switch (index) {
            case 0:
            {
                [weakself InternationalizationFunctionWithLocalizable];
            }
                break;
            case 1:
            {
                [weakself newLocalizable];
            }
                break;
            default:
                break;
        }

    } cancelAction:^{
        
        
        
    }];

    
}


- (void)InternationalizationFunctionWithLocalizable {
    
    self.photoImageView.image = [UIImage imageNamed:NSLocalizedString(k_TestImage, nil)];
    
    [self.addBtn setTitle:FGGetStringWithKeyFromTable(k_Addnotification, k_BB_Table1) forState:UIControlStateNormal];
    
    [self.removeBtn setTitle:FGGetStringWithKeyFromTable(k_RemoveNotifications, k_BB_Table1) forState:UIControlStateNormal ];
    
    [self.testBtn setTitle:FGGetStringWithKeyFromTable(k_Internationalization, k_BB_Table1) forState:UIControlStateNormal];
    
}


- (void)newLocalizable {
    
    self.photoImageView.image = [UIImage imageNamed:NSLocalizedStringFromTable(k_TestImage, k_BB_Table1, nil)];
    
    [self.addBtn setTitle:NSLocalizedStringFromTable(k_Addnotification, k_BB_Table1, nil) forState:UIControlStateNormal];
    
    
    [self.removeBtn setTitle:NSLocalizedStringFromTable(k_RemoveNotifications, k_BB_Table1, nil) forState:UIControlStateNormal];

}





- (IBAction)addAction:(id)sender {
    
    [self addLocationNotificaiton];
    
}
- (IBAction)removeNotificaiton:(id)sender {
    //// 取消所有本地通知
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


- (void)addLocationNotificaiton {
    
    if (IOS_Version > 10.0) {
        //iOS 10.0及之后
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        
        //Local Notification
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        content.title = @"Introduction to Notifications";
        content.subtitle = @"Session 707";
        content.body = @"Woah! These new notifications look amazing! Don’t you agree?";
        content.badge = @1;
        content.userInfo = @{@"name" :@"测试!"};
        content.sound = [UNNotificationSound defaultSound];
       
        // 多长时间后提醒
        UNTimeIntervalNotificationTrigger *trigger1 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5 repeats:NO];
        
        //重复提醒, 最短要一分钟
        UNTimeIntervalNotificationTrigger *trigger2 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:60 repeats:YES];
        
        
        //每周一下午 16：35 提醒我给老婆做早饭
        NSDateComponents *components = [[NSDateComponents alloc] init];
        components.weekday = 2;
        components.hour = 16;
        components.minute = 35;
        UNCalendarNotificationTrigger *trigger3 = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
        
        
        
        NSString *requestIdentifier = @"sampleRequest";
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifier
                                                                              content:content
                                                                              trigger:trigger1];
        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
            
        }];

        
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge|UNAuthorizationOptionSound|UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
            if (!error) {
                DebugLog(@"request authorization succeeded!");
            }
            
        }];
        
        
    }else{
        
        //iOS 10.0之前 注册推送
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound |UIUserNotificationTypeAlert) categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        
#pragma mark - 本地通知
        
        //创建本地通知
        UILocalNotification *ln = [[UILocalNotification alloc]init];
        //通知内容
        ln.alertBody = @"卧槽,今天好热";
        //触发开始时间
        ln.fireDate = [NSDate dateWithTimeIntervalSinceNow:4];
        //重复时间间隔
        //    ln.repeatInterval = NSCalendarUnitSecond;
        
        
        [[UIApplication sharedApplication] scheduleLocalNotification:ln];
        
    }


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
