//
//  settingViewController.h
//  TimeBuy
//
//  Created by Mr.OJ on 15/8/8.
//  Copyright (c) 2015年 Mr.OJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SlideNavigationController.h"
#import "KLCPopup.h"
#import "profilesViewController.h"
#import "systemSetting/systemSettingView.h"
#import "releaseInfoViewController.h"
#import "myTravelViewController.h"
#import "messageViewController.h"
#import "mySheduleViewController.h"


@interface settingViewController : UIViewController <UIAlertViewDelegate>
{
    UIView *shadowView;
}

//@property (strong, nonatomic) IBOutlet UITableView *settingTableView;
//@property (strong, nonatomic) NSArray *menuArray;
@property (strong, nonatomic) IBOutlet UIImageView *portaitImg;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;
@property (strong, nonatomic) IBOutlet UILabel *likeLabel;
@property (strong, nonatomic) IBOutlet UILabel *aboutLabel;
@property (strong, nonatomic) IBOutlet UIImageView *sexImg;
@property (strong, nonatomic) IBOutlet UILabel *sexLabel;
@property (strong, nonatomic) IBOutlet UILabel *professionLabel;

@property (strong, nonatomic) IBOutlet UIButton *releaseButton;
@property (strong, nonatomic) IBOutlet UIButton *settingButton;
@property (strong, nonatomic) IBOutlet UIButton *informationButton;
@property (strong, nonatomic) IBOutlet UIButton *myTravelButton;
@property (strong, nonatomic) IBOutlet UIButton *myNoticeButton;
@property (strong, nonatomic) IBOutlet UIButton *myScheduleButton;
@property (strong, nonatomic) IBOutlet UIButton *logoutButton;

- (IBAction)release:(id)sender;
- (IBAction)setting:(id)sender;
- (IBAction)information:(id)sender;
- (IBAction)myTravel:(id)sender;
- (IBAction)myNotice:(id)sender;
- (IBAction)mySchedule:(id)sender;
- (IBAction)logout:(id)sender;

@end
