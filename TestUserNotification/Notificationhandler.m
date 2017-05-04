//
//  Notificationhandler.m
//  TestUserNotification
//
//  Created by 李俊涛 on 2017/5/3.
//  Copyright © 2017年 李俊涛. All rights reserved.
//

#import "Notificationhandler.h"

@implementation Notificationhandler

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    
    NSString *identifier = notification.request.identifier;
    UNNotificationPresentationOptions options = UNNotificationPresentationOptionNone; //默认什么也不做，不显示
    if (identifier == nil) {
        completionHandler(options);
        return;
    }
    //项目中出现过的通知都设置为前台可以显示
    if ([identifier isEqualToString:@"timeInterVal"]) {
        options = UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert;
    } else if ([identifier isEqualToString:@"pendingRemoval"]) {
        options = UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert;
    } else if ([identifier isEqualToString:@"pendingUpdate"]) {
        options = UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert;
    } else if ([identifier isEqualToString:@"deliveredRemoval"]) {
        options = UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert;
    } else if ([identifier isEqualToString:@"deliveredUpdate"]) {
        options = UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert;
    } else if ([identifier isEqualToString:@"category"]) {
        options = UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert;
    } else if ([identifier isEqualToString:@"media"]) {
        options = UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert;
    } else if ([identifier isEqualToString:@"costomize"]) {
        options = UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert;
    } else {
        options = UNNotificationPresentationOptionNone;
    }
    //设置完成之后必须调用这个回调，
    completionHandler(options);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    NSString *categoryIdentifier = response.notification.request.content.categoryIdentifier;
    //比较categoryIdentifier
    if ([categoryIdentifier isEqualToString:@"ljtAction"]) {
        //交互逻辑
        [self handlerAction:response];
    }
    completionHandler();
}

- (void)handlerAction:(UNNotificationResponse *)response {
    NSString *textStr = nil;
    NSString *actionIdentifier = response.actionIdentifier;
    if (actionIdentifier == nil || [actionIdentifier isEqualToString:@""]) {
        return;
    }
    
    if ([actionIdentifier isEqualToString:@"input"]) {
        textStr = [(UNTextInputNotificationResponse *)response userText];
    } else if ([actionIdentifier isEqualToString:@"goodbye"]) {
        textStr = @"goodbye";
    } else {
        textStr = @"none";
    }
    NSLog(@"收到通知：%@",textStr);
}
@end
