//
//  TimeIntervalForegroundViewController.m
//  TestUserNotification
//
//  Created by 李俊涛 on 2017/5/3.
//  Copyright © 2017年 李俊涛. All rights reserved.
//

#import "TimeIntervalForegroundViewController.h"
#import "UserNotifications/UserNotifications.h"
@interface TimeIntervalForegroundViewController ()
@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@end

@implementation TimeIntervalForegroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)scheduleAction:(id)sender {
    if ([self.timeTextField.text isEqualToString:@""]) {
        NSLog(@"请输入时间");
        return;
    }
    //创建通知内容
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"发送通知";
    content.body = @"发送通知的内容";
    
    //创建发送触发
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:[self.timeTextField.text doubleValue] repeats:NO];
    
    //设置一个发送请求标识符
    NSString *identifier = @"timeInterVal";
    
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
