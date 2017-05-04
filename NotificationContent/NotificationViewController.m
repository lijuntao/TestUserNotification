//
//  NotificationViewController.m
//  NotificationContent
//
//  Created by 李俊涛 on 2017/5/3.
//  Copyright © 2017年 李俊涛. All rights reserved.
//

#import "NotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface NotificationViewController () <UNNotificationContentExtension>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) NSMutableArray *items;
@property (assign, nonatomic) int index;
@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any required interface initialization here.
    self.index = 0;
}

- (void)didReceiveNotification:(UNNotification *)notification {
    UNNotificationContent *content = notification.request.content;
    NSArray *array = content.userInfo[@"items"];
    if (array.count <= 0) {
        return;
    }
    for (int i = 0; i < array.count; i++) {
        NSDictionary *dic = array[i];
        NSMutableDictionary *mutDic = [[NSMutableDictionary alloc] initWithCapacity:3];
        [mutDic setObject:[dic objectForKey:@"title"] forKey:@"title"];
        [mutDic setObject:[dic objectForKey:@"text"] forKey:@"text"];
        NSString *urlPath = [content.attachments[i].URL  absoluteString];
        [mutDic setObject:urlPath forKey:@"url"];
        if (self.items == nil) {
            self.items = [[NSMutableArray alloc] initWithCapacity:2];
        }
        [self.items addObject:[mutDic copy]];
    }
    [self updateUI:self.index];
}

- (void)updateUI:(int)index {
    NSDictionary *dic = self.items[index];
    NSString *path = [dic[@"url"] substringFromIndex:7];
    self.imageView.image = [UIImage imageWithContentsOfFile:path];
    self.titleLabel.text = dic[@"title"];
    self.rightLabel.text = dic[@"text"];
}

- (void)didReceiveNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion {
    if ([response.actionIdentifier isEqualToString:@"switch"]) {
        if (self.index == 0) {
            self.index = 1;
        } else {
            self.index = 0;
        }
        [self updateUI:self.index];
        completion(UNNotificationContentExtensionResponseOptionDoNotDismiss);
    } else if ([response.actionIdentifier isEqualToString:@"open"]) {
        NSLog(@"open");
        completion(UNNotificationContentExtensionResponseOptionDismissAndForwardAction);
    } else if ([response.actionIdentifier isEqualToString:@"dismiss"]) {
        NSLog(@"dismiss");
        completion(UNNotificationContentExtensionResponseOptionDismiss);
    } else {
        completion(UNNotificationContentExtensionResponseOptionDismiss);
    }
}


@end
