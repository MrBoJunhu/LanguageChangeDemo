//
//  ShowMessageObject.m
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/25.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ShowMessageObject.h"
@implementation ShowMessageObject

- (instancetype)init{
    
    if (self = [super init]) {
        
    }
    
    return self;
}

+(instancetype)showMessageWithController:(UIViewController *)controller  Title:(NSString *)title message:(NSString *)message  style:(UIAlertControllerStyle)style  cancelStyle:(UIAlertActionStyle)cancelStyle actionTitles:(NSArray<NSString *>*)actionTitles cancelTitle:(NSString *)cancelTitle clickChooseAction:(clickActionBlock)actionBlock cancelAction:(clickCancelBlock)cancelBlock{
    
    ShowMessageObject *showMsg = [[ShowMessageObject alloc] init];
    
    showMsg.actionBlock = actionBlock;
    
    showMsg.cancelBlock = cancelBlock;
    
    if (actionTitles.count > 0 ) {
        
        message = message.length > 0 ? message : @"";
        
        title = title.length > 0 ? title : @"";
        
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
        
        for (NSUInteger i = 0 ; i < actionTitles.count; i ++) {
            
            NSString *actionTitle = actionTitles[i];
            
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                [showMsg clickSelectedAction:i];
                
            }];
            
            [alertC addAction:alertAction];
            
        }
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:cancelStyle handler:^(UIAlertAction * _Nonnull action) {
            
            [showMsg cancelAction];
            
        }];
        
        [alertC addAction:cancelAction];
        
        [controller presentViewController:alertC animated:YES completion:^{
            
        }];
    
    }
    
    return showMsg;
    
}

- (void)clickSelectedAction:(NSUInteger)index {
    
    if (self.actionBlock) {
        
        self.actionBlock(index);
        
    }
    
}

- (void)cancelAction {
    
    if (self.cancelBlock) {
        
        self.cancelBlock();
        
    }
    
}

@end
