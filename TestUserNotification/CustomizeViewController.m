//
//  CustomizeViewController.m
//  TestUserNotification
//
//  Created by 李俊涛 on 2017/5/3.
//  Copyright © 2017年 李俊涛. All rights reserved.
//

#import "CustomizeViewController.h"
#import "UserNotifications/UserNotifications.h"
@interface CustomizeViewController ()

@end

@implementation CustomizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //导航栏标题
    self.navigationItem.title = @"自定义UI通知";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)costomizeAction:(id)sender {
    //创建通知内容
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"costomize";
    content.body = @"show me some images!";
    
    //添加附件图片资源
    NSString *imagePathOnevcat = [[NSBundle mainBundle] pathForResource:@"onevcat" ofType:@"jpg"];
    UNNotificationAttachment *attachmentOnevcat = [UNNotificationAttachment attachmentWithIdentifier:@"onevcat" URL:[NSURL fileURLWithPath:imagePathOnevcat] options:nil error:nil];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpg"];
    UNNotificationAttachment *attachment = [UNNotificationAttachment attachmentWithIdentifier:@"image" URL:[NSURL fileURLWithPath:imagePath] options:nil error:nil];
    content.attachments = @[attachmentOnevcat,attachment];
    
    //增加userInfo携带信息
    content.userInfo = @{@"items":@[@{@"title": @"Photo 1",@"text": @"Cute cat"},@{@"title": @"Photo 2",@"text": @"Cute girl"}]};
    
    //设置交互类型
    content.categoryIdentifier = @"customUI";
    
    //创建发送触发
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:5.0 repeats:NO];
    
    //设置一个发送请求标识符
    NSString *identifier = @"costomize";
    
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
