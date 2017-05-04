//
//  CategoryViewController.m
//  TestUserNotification
//
//  Created by 李俊涛 on 2017/5/3.
//  Copyright © 2017年 李俊涛. All rights reserved.
//

#import "CategoryViewController.h"
#import "UserNotifications/UserNotifications.h"
@interface CategoryViewController ()

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //导航栏标题
    self.navigationItem.title = @"交互通知";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)categoryAction:(id)sender {
    //创建一个通知内容
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"category";
    content.body = @"ljt&ths";
    
    
    //设置交互类型 与注册的category的标识符一样
    content.categoryIdentifier = @"ljtAction";
    
    //创建触发时间
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.0 repeats:NO];
    
    //设置通知标识
    NSString *identifier = @"category";
    
    //创建通知请求
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
    
    //将通知请求添加到通知中心中
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError *error){
        if (error) {
            NSLog(@"发送失败%@",error);
        } else {
            NSLog(@"发送成功%@",error);
        }
    }];
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
