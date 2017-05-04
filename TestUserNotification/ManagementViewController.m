//
//  ManagementViewController.m
//  TestUserNotification
//
//  Created by 李俊涛 on 2017/5/3.
//  Copyright © 2017年 李俊涛. All rights reserved.
//

#import "ManagementViewController.h"
#import "UserNotifications/UserNotifications.h"
@interface ManagementViewController ()

@end

@implementation ManagementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //导航栏标题
    self.navigationItem.title = @"通知管理";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pendingRemovalAction:(id)sender {
    
    //创建通知内容
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"pendingRemoval";
    content.body = @"ljt&ths";
    
    //创建发送触发 5秒后通知
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.0 repeats:NO];
    
    //设置一个发送请求标识符
    NSString *identifier = @"pendingRemoval";
    
    //创建一个发送请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger ];
    
    //将发送请求添加到发送中心
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError *error){
        if (error) {
            NSLog(@"发送失败%@",error);
        } else {
            NSLog(@"发送成功%@",error);
        }
    }];
    
    //发送之后可以在通知未发出的时间内取消
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"移除通知请求 %@",identifier);
        [[UNUserNotificationCenter currentNotificationCenter] removePendingNotificationRequestsWithIdentifiers:@[identifier]];  //标识符要一致
    });
}
- (IBAction)pendingUpdateAction:(id)sender {
    //创建通知
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"pendingUpdate";
    content.body = @"ljt&ths";
    
    //创建发送触发 5秒
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.0 repeats:NO];
    
    //创建通知标识
    NSString *identifier = @"pendingUpdate";
    
    //创建一个发送通知请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
    
    //将发送通知请求添加到通知中心
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError *error){
        if (error) {
            NSLog(@"发送失败%@",error);
        } else {
            NSLog(@"发送成功%@",error);
        }
    }];
    
    //发送之后可以在通知未发出的时间内取消  通知的标识符要一致
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"准备更新请求");
        //创建新的通知
        UNMutableNotificationContent *contentNew = [[UNMutableNotificationContent alloc] init];
        contentNew.title = @"pendingUpdate";
        contentNew.body = @"ths&ljt";
        
        //创建发送触发 1秒
        UNTimeIntervalNotificationTrigger *triggerNew = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1.0 repeats:NO];
        
        //创建一个新的发送通知请求
        UNNotificationRequest *requestNew = [UNNotificationRequest requestWithIdentifier:identifier content:contentNew trigger:triggerNew];
        
        //将新的发送通知请求添加到通知中心
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:requestNew withCompletionHandler:^(NSError *error){
            if (error) {
                NSLog(@"发送失败%@",error);
            } else {
                NSLog(@"发送成功%@",error);
            }
        }];
    });
}
- (IBAction)deliveredRemovalAction:(id)sender {
    //创建通知
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"deliveredRemoval";
    content.body = @"ljt&ths";
    
    //创建发送触发 5秒
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.0 repeats:NO];
    
    //创建通知标识
    NSString *identifier = @"deliveredRemoval";
    
    //创建一个发送通知请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
    
    //将发送通知请求添加到通知中心
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError *error){
        if (error) {
            NSLog(@"发送失败%@",error);
        } else {
            NSLog(@"发送成功%@",error);
        }
    }];
    
    //发送之后并且通知已经展示过，移除通知
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"移除通知请求 %@",identifier);
        [[UNUserNotificationCenter currentNotificationCenter] removeDeliveredNotificationsWithIdentifiers:@[identifier]];
    });
    
}
- (IBAction)deliveredUpdateAction:(id)sender {
    //创建通知
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"deliveredUpdate";
    content.body = @"ljt&ths";
    
    //创建发送触发 5秒
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.0 repeats:NO];
    
    //创建通知标识
    NSString *identifier = @"deliveredUpdate";
    
    //创建一个发送通知请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
    
    //将发送通知请求添加到通知中心
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError *error){
        if (error) {
            NSLog(@"发送失败%@",error);
        } else {
            NSLog(@"发送成功%@",error);
        }
    }];
    
    //发送之后并且通知已经展示过，移除通知  通知的标识符要一致
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(7.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"准备更新请求");
        //创建新的通知
        UNMutableNotificationContent *contentNew = [[UNMutableNotificationContent alloc] init];
        contentNew.title = @"deliveredUpdate";
        contentNew.body = @"ths&ljt";
        
        //创建发送触发 1秒
        UNTimeIntervalNotificationTrigger *triggerNew = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1.0 repeats:NO];
        
        //创建一个新的发送通知请求
        UNNotificationRequest *requestNew = [UNNotificationRequest requestWithIdentifier:identifier content:contentNew trigger:triggerNew];
        
        //将新的发送通知请求添加到通知中心
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:requestNew withCompletionHandler:^(NSError *error){
            if (error) {
                NSLog(@"发送失败%@",error);
            } else {
                NSLog(@"发送成功%@",error);
            }
        }];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
