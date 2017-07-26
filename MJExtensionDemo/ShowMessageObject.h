//
//  ShowMessageObject.h
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/25.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowMessageObject : NSObject
/**
 点击按钮
 */
typedef void(^clickActionBlock)(NSUInteger index);

typedef void(^clickCancelBlock)();

@property (nonatomic, copy) clickActionBlock actionBlock;

@property (nonatomic, copy) clickCancelBlock cancelBlock;

+(instancetype)showMessageWithController:(UIViewController *)controller  Title:(NSString *)title message:(NSString *)message  style:(UIAlertControllerStyle)style  cancelStyle:(UIAlertActionStyle)cancelStyle actionTitles:(NSArray<NSString *>*)actionTitles cancelTitle:(NSString *)cancelTitle clickChooseAction:(clickActionBlock)actionBlock cancelAction:(clickCancelBlock)cancelBlock;

@end
