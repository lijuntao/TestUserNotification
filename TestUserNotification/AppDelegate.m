//
//  AppDelegate.m
//  TestUserNotification
//
//  Created by 李俊涛 on 2017/5/2.
//  Copyright © 2017年 李俊涛. All rights reserved.
//

#import "AppDelegate.h"
#import "Notificationhandler.h"

@interface AppDelegate ()

@property (strong, nonatomic) Notificationhandler *handler;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //注册category
    [self registerNotificationCategory];
    //设置代理
    self.handler = [[Notificationhandler alloc] init];
    [UNUserNotificationCenter currentNotificationCenter].delegate = self.handler;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //deviceToken是个NSData数据
    NSLog(@"获得远程服务器Device Token");
}

- (void)registerNotificationCategory {
    NSArray *actionsArray = @[
                              [UNTextInputNotificationAction actionWithIdentifier:@"input" title:@"Input" options:UNNotificationActionOptionForeground textInputButtonTitle:@"Send" textInputPlaceholder:@"说点什么吧？"],
                              [UNNotificationAction actionWithIdentifier:@"goodbye" title:@"Goodbye" options:UNNotificationActionOptionForeground],
                              [UNNotificationAction actionWithIdentifier:@"cancel" title:@"Cancel" options:UNNotificationActionOptionForeground]];
    //注意注册的category的标识符为 ljtAction
    UNNotificationCategory *category = [UNNotificationCategory categoryWithIdentifier:@"ljtAction" actions:actionsArray intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
    
    NSArray *actionsArrayUI = @[
                              [UNNotificationAction actionWithIdentifier:@"switch" title:@"Switch" options:UNNotificationActionOptionForeground],
                              [UNNotificationAction actionWithIdentifier:@"open" title:@"Open" options:UNNotificationActionOptionForeground],
                              [UNNotificationAction actionWithIdentifier:@"dismiss" title:@"Dismiss" options:UNNotificationActionOptionForeground]];
    UNNotificationCategory *categoryUI = [UNNotificationCategory categoryWithIdentifier:@"customUI" actions:actionsArrayUI intentIdentifiers:@[] options:UNNotificationCategoryOptionCustomDismissAction];
    
    NSSet *set = [NSSet setWithObjects:category,categoryUI,nil];
    [[UNUserNotificationCenter currentNotificationCenter] setNotificationCategories:set];
}
@end
