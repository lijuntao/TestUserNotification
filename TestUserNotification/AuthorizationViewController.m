//
//  AuthorizationViewController.m
//  TestUserNotification
//
//  Created by 李俊涛 on 2017/5/3.
//  Copyright © 2017年 李俊涛. All rights reserved.
//

#import "AuthorizationViewController.h"
#import "UserNotifications/UserNotifications.h"

@interface AuthorizationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *deviceTokenLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationCenterSettingLabel;
@property (weak, nonatomic) IBOutlet UILabel *soundSettingLabel;
@property (weak, nonatomic) IBOutlet UILabel *badgeSettingLabel;
@property (weak, nonatomic) IBOutlet UILabel *lockScreenSettingLabel;
@property (weak, nonatomic) IBOutlet UILabel *alertSettingLabel;
@property (weak, nonatomic) IBOutlet UILabel *carPlaySettingLabel;
@property (weak, nonatomic) IBOutlet UILabel *alertStyleSettingLabel;

//通知设置
@property (strong, nonatomic) UNNotificationSettings *settings;
@end

@implementation AuthorizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //修正导航条
    self.navigationItem.title = @"权限申请";
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"点击开通" style:UIBarButtonItemStylePlain target:self action:@selector(requestAnthorizationAction:)];
    self.navigationItem.rightBarButtonItem = rightBtnItem;
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateSetting:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Btn Action

- (void)requestAnthorizationAction:(id)sender {
    NSLog(@"点击开通");
    [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError *__nullable error){
        //如果granted为YES 则说明申请成功
        if (granted) {
            NSLog(@"开通成功");
            [[UIApplication sharedApplication] registerForRemoteNotifications];
        } else {
            NSLog(@"开通失败");
        }
    }];
}

#pragma mark Private

- (void)updateUI {
    self.notificationCenterSettingLabel.text = [self getSettingText:self.settings.notificationCenterSetting];
    self.soundSettingLabel.text = [self getSettingText:self.settings.soundSetting];
    self.badgeSettingLabel.text = [self getSettingText:self.settings.badgeSetting];
    self.lockScreenSettingLabel.text = [self getSettingText:self.settings.lockScreenSetting];
    self.alertSettingLabel.text = [self getSettingText:self.settings.alertSetting];
    self.carPlaySettingLabel.text = [self getSettingText:self.settings.carPlaySetting];
    self.alertStyleSettingLabel.text = [self getAlertStyleText:self.settings.alertStyle];
}

- (void)updateSetting:(id)notification {
    [[UNUserNotificationCenter currentNotificationCenter] getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings){
        self.settings = settings; //self的setting的成员类型为：UNNotificationSettings
        [self updateUI];
    }];
}

- (NSString *)getSettingText:(UNNotificationSetting)setting{
    NSString *returnStr = @"Not";
    switch (setting) {
        case UNNotificationSettingNotSupported:
            returnStr = @"Not Supported";
            break;
        case UNNotificationSettingEnabled:
            returnStr = @"Enabled";
            break;
        default:
            returnStr = @"Disabled";
            break;
    }
    return returnStr;
}

- (NSString *)getAlertStyleText:(UNAlertStyle)style {
    NSString *returnStr = @"Not";
    switch (style) {
        case UNAlertStyleNone:
            returnStr = @"None";
            break;
        case UNAlertStyleBanner:
            returnStr = @"Banner";
            break;
        default:
            returnStr = @"Alert";
            break;
    }
    return returnStr;
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
