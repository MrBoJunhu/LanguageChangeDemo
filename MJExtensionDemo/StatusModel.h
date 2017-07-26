//
//  StatusModel.h
//  MJExtensionDemo
//
//  Created by BillBo on 2017/7/24.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <Foundation/Foundation.h>
//模型嵌套
@class User;
@interface StatusModel : NSObject
/** 微博文本内容 */
@property (copy, nonatomic) NSString *text;
/** 微博作者 */
@property (strong, nonatomic) User *user;
/** 转发的微博 */
@property (strong, nonatomic) StatusModel *retweetedStatus;
@end
